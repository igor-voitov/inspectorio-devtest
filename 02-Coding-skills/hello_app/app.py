from flask import Flask
from flask_restful import reqparse, abort, Api, Resource

app = Flask(__name__)
api = Api(app)

TODOS = {
    'todo1': {'task': 'build an API'},
    'todo2': {'task': '?????'},
    'todo3': {'task': 'profit!'},
}


def abort_if_todo_doesnt_exist(todo_id):
    if todo_id not in TODOS:
        abort(404, message="Todo {} doesn't exist".format(todo_id))

parser = reqparse.RequestParser()
parser.add_argument('task')






mystatus = "test"


# heathz
class healthz(Resource):
    def get(self):
        if mystatus == "norm":
            return {'status': 'OK'}, 200
        else:
            return {'status': 'notok'}, 503
        
        




# ec2
class ec2(Resource):
    def get(self):
        return TODOS

    def post(self):
        args = parser.parse_args()
        todo_id = int(max(TODOS.keys()).lstrip('todo')) + 1
        todo_id = 'todo%i' % todo_id
        TODOS[todo_id] = {'task': args['task']}
        return TODOS[todo_id], 201






##
## Actually setup the Api resource routing here
##
api.add_resource(healthz, '/healthz')
api.add_resource(ec2, '/ec2')


if __name__ == '__main__':
    app.run(debug=True)