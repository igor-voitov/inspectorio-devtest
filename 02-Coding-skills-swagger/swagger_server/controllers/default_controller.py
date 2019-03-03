import connexion
import six

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
    return 'do some magic!'
