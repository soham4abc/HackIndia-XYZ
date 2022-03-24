from scripts import test2
from flask import Flask
from flask_restful import Resource, Api, reqparse
import pandas as pd
import ast
from flask_cors import CORS


# PERMANENT_PATH= "C:/xampp/htdocs/ocr/Backend/API/"
PERMANENT_PATH = ""
URL = "https://ocr.findcodes.xyz/"

app = Flask(__name__)
api = Api(app)
CORS(app, supports_credentials=True)


class Users(Resource):
    # methods go here
    def post(self):
        parser = reqparse.RequestParser()  # initialize

        parser.add_argument("data", required=True)

        args = parser.parse_args()  # parse arguments to dictionary

        # create new dataframe containing new values
        new_data = pd.DataFrame({"index": [[]], "data": args["data"]})
        # read our CSV
        data = pd.read_csv(PERMANENT_PATH + "users.csv")
        # add the newly provided values
        data = data.append(new_data, ignore_index=True)
        test2.text_to_image(new_data)
        # save back to CSV
        data.to_csv(PERMANENT_PATH + "users.csv", index=False)
        return {"data": URL + "/documents/MyFile.docx"}, 200

    def get(self):

        data = pd.read_csv("./users.csv")  # read CSV
        data = data.to_dict()  # convert dataframe to dictionary
        return {"data": data}, 200  # return data and 200 OK code
        # return {'data': "works"}, 200  # return data and 200 OK code

    pass


class Locations(Resource):
    def get(self):

        data = pd.read_csv("./locations.csv")  # read CSV
        data = data.to_dict()  # convert dataframe to dictionary
        return {"data": data}, 200  # return data and 200 OK code
        # return {'data': "works"}, 200  # return data and 200 OK code

    pass


api.add_resource(Users, "/users")  # '/users' is our entry point for Users
api.add_resource(
    Locations, "/locations"
)  # and '/locations' is our entry point for Locations


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=81)  # run our Flask app
