import connexion
import six
import os

from swagger_server.models.aws_info import AwsInfo  # noqa: E501
from swagger_server import util


def get_ec2_instances(AwsInfo=None):  # noqa: E501
    """List AWS EC2 instances

    Get all EC2 instances in one region with match state # noqa: E501

    :param AwsInfo: Request body
    :type AwsInfo: dict | bytes

    :rtype: None
    """
    if connexion.request.is_json:
        AwsInfo = AwsInfo.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def healthz_get():  # noqa: E501
    """Health Check

    The healthcheck endpoint provides detailed information about the health of a service. # noqa: E501


    :rtype: None
    """
    AWS_ACCOUNT_ID = os.environ.get('AWS_ACCOUNT_ID')
    AWS_ACCESS_KEY = os.environ.get('AWS_ACCESS_KEY')
    AWS_SECRET_KEY = os.environ.get('AWS_SECRET_KEY')
    if AWS_ACCOUNT_ID is not None:
        return {"AWS_ACCOUNT_ID": AWS_ACCOUNT_ID}, 200
    else:
        return {"AWS_ACCOUNT_ID": AWS_ACCOUNT_ID}, 503
