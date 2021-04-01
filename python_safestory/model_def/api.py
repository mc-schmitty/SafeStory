from flask import Flask, request, Response
from flask_restful import Resource, Api
import model

app = Flask(__name__)
api = Api(app)


class Story(Resource):

    def post(self):
        json_data = request.get_json(force=True)
        print(json_data)
        if not json_data:
            return {'message': 'No input story provided'}, 400

        story_text = json_data['story']
        if not story_text:
            return {'message': 'No input story found (label as "story")'}, 413
        print(story_text)
        # Send in story to model here
        force, explicit, authority, minor_inj, conscious, clean_text = "0", "0", "0", "0", "0", ""

        # Get back categories from model
        force = model.calculateForce(story_text)
        print(force)
        explicit = model.calculateConsent(story_text)
        print(explicit)
        authority = model.calculateAuthority(story_text)
        print(authority)
        minor_inj = model.countInjury(story_text)
        print(minor_inj)
        conscious = model.calculateConscious(story_text)
        print(conscious)
        # clean_text = model.stemmed(model.remove_symbols(story_text).lower())
        # print(clean_text)

        # Return json with categories
        return {'message': 'Success!',
                #'Clean_Text': clean_text,
                'Force': force[0],
                'Explicit_Lack_Of_Consent': explicit[0],
                'Authority': authority[0],
                'Minor_Injury': minor_inj,
                'Not_Conscious': conscious[0]
                }
    
    def get(self):
        return {'message': 'SafeStory'}

class Setup(Resource):

    # For starting instance, possibly unnecessary
    def get(self):
        return Response(status=201)

api.add_resource(Story, '/')
api.add_resource(Setup, '/_ah/start')

if __name__ == '__main__':
    app.run(debug=True)
