#!/usr/bin/env python
# coding: utf-8

import re

import pandas as pd
from imblearn.over_sampling import RandomOverSampler
from imblearn.under_sampling import RandomUnderSampler
from nltk.stem.snowball import SnowballStemmer
from sklearn.feature_extraction import text
from sklearn.linear_model import SGDClassifier, LogisticRegression
from sklearn.svm import SVC


def stemmed(corpus):
    stemmer = SnowballStemmer("english")
    return " ".join(stemmer.stem(word) for word in corpus.split(" "))


def remove_symbols(corpus):
    corpus = re.sub(r'\W+', ' ', corpus)
    corpus = re.sub(" \d+", " ", corpus)
    corpus = re.sub(' s ', ' ', corpus)
    corpus = re.sub(' ve ', ' ', corpus)
    corpus = re.sub(' m ', ' ', corpus)
    corpus = re.sub(' t ', ' ', corpus)
    return corpus


def calculateForce(inputs):
    file = pd.read_csv('savedd1.csv')
    file = file.fillna(0)

    inputs = remove_symbols(inputs)
    inputs = inputs.lower()
    inputs = stemmed(inputs)

    inputs = [inputs]

    X = file.clean
    y = file['Force']

    bagger = text.TfidfVectorizer(min_df=2, ngram_range=(1, 3))
    lr = SVC(kernel='linear', C=1)

    X_train = bagger.fit_transform(X)
    S = bagger.transform(inputs)  # input must be transformed here.

    lr.fit(X_train, y)
    pred = lr.predict(S)
    return pred


# In[23]:


# inputs = 'he groped me'
# calculateForce(inputs)

# In[24]:


# inputs = 'he catcalled me'
# calculateForce(inputs)


# In[25]:


def calculateConsent(inputs):
    file = pd.read_csv('savedd1.csv')
    file = file.fillna(0)

    # stemmer = SnowballStemmer("english")

    inputs = remove_symbols(inputs)
    inputs = inputs.lower()
    inputs = stemmed(inputs)

    inputs = [inputs]

    X = file.clean
    y = file['Explicit_Lack_Of_Consent']

    bagger = text.TfidfVectorizer(min_df=2, ngram_range=(1, 4))
    lr = SGDClassifier(alpha=0.0001, loss='hinge', penalty='l2', class_weight={1: 0.7, 0: 0.3}, )

    X_train = bagger.fit_transform(X)
    S = bagger.transform(inputs)  # input must be transformed here.

    lr.fit(X_train, y)
    pred = lr.predict(S)
    return pred


# In[26]:


# inputs = "I never said no"
# calculateConsent(inputs)


# In[27]:


# this one needs work....

def calculateAuthority(inputs):
    file = pd.read_csv('savedd1.csv')
    file = file.fillna(0)

    # stemmer = SnowballStemmer("english")

    inputs = remove_symbols(inputs)
    inputs = inputs.lower()
    inputs = stemmed(inputs)
    inputs = [inputs]

    file = file.sort_values(by=['Authority'])
    file = file.iloc[500:]

    file = file.reset_index(drop=True)

    X = file.clean
    y = file['Authority']

    bagger = text.TfidfVectorizer(min_df=1, ngram_range=(1, 1))
    ns = RandomOverSampler(sampling_strategy='minority')
    ms = RandomUnderSampler(sampling_strategy='majority')

    lr = SGDClassifier(loss='log', n_jobs=-1, alpha=5e-2)

    X_train = bagger.fit_transform(X)
    S = bagger.transform(inputs)

    lr.fit(X_train, y)
    pred = lr.predict(S)
    return pred


# In[28]:


# inputs = "Sexual assault by my godfather, my parents trusted me into his care often as they were going through a
# divorce" calculateAuthority(inputs)

# In[29]:


def calculateConscious(inputs):
    file = pd.read_csv('savedd1.csv')
    file = file.fillna(0)

    # stemmer = SnowballStemmer("english")

    inputs = remove_symbols(inputs)
    inputs = inputs.lower()
    inputs = stemmed(inputs)
    inputs = [inputs]

    file = file.sort_values(by=['Authority'])
    file = file.iloc[500:]

    file = file.reset_index(drop=True)

    file = file.sort_values(by=['Not_Conscious'])
    file = file.iloc[600:]

    file = file.reset_index(drop=True)

    X = file.clean
    y = file['Not_Conscious']

    bagger = text.TfidfVectorizer(ngram_range=(1, 1))

    lr = LogisticRegression(solver='liblinear', class_weight='balanced')

    X_train = bagger.fit_transform(X)
    S = bagger.transform(inputs)  # input must be transformed here.

    lr.fit(X_train, y)
    pred = lr.predict(S)
    return (pred)


# In[30]:


# inputs = "remember leaving the bar, and wobbling all over the place like a drunken idiot, trying to work out where
# I was. I remember falling over a few times and cutting my legs on the ground. It was a small town,
# and I was looking for a taxi to get back to my hotel. The next thing I remember was that same woman from the bar
# had presumably followed me, and given that I could barely stand, she helped walk me back to her place nearby. I was
# in no state to resist, as I could not even walk without support.The next thing I remember is regaining
# consciousness a bit, with her naked on top of me in her bed" calculateConscious(inputs)

# In[31]:


def countInjury(inputs):
    result = 0
    arr2 = ["purple", "blue", "danger", "twist", "punch", "slap", "smack", "assault", "drag", "paralyz", "injuri",
            "fight", "fought", "threw", "beat", "beaten", "hurt", "abus", "wound", "bleed", "bled", "hit", "push",
            "brui"]

    # def stemmed(corpus):
    #   return " ".join(stemmer.stem(word) for word in corpus.split(" "))

    # def remove_symbols(corpus):
    #    corpus = re.sub(r'\W+', ' ', corpus)
    #    corpus = re.sub(" \d+", " ", corpus)
    #    corpus = re.sub(' s ', ' ', corpus)
    #    corpus = re.sub(' ve ', ' ', corpus)
    #    corpus = re.sub(' m ', ' ', corpus)
    #    corpus = re.sub(' t ', ' ', corpus)
    #    return corpus

    # stemmer = SnowballStemmer("english")

    inputs = remove_symbols(inputs)
    inputs = inputs.lower()
    inputs = stemmed(inputs)

    res = [ele for ele in arr2 if (ele in inputs)]
    if len(res) >= 1:
        result = 1

    return result

# In[38]:


# inputs = "i hit a real home run, real batter outa the park!"
# countInjury(inputs)
