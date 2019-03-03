# coding: utf-8

from __future__ import absolute_import

from flask import json
from six import BytesIO

from swagger_server.models.aws_info import AwsInfo  # noqa: E501
from swagger_server.test import BaseTestCase


class TestDefaultController(BaseTestCase):
    """DefaultController integration test stubs"""

    def test_get_ec2_instances(self):
        """Test case for get_ec2_instances

        List AWS EC2 instances
        """
        AwsInfo = AwsInfo()
        response = self.client.open(
            '/ec2',
            method='POST',
            data=json.dumps(AwsInfo),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_healthz_get(self):
        """Test case for healthz_get

        Health Check
        """
        response = self.client.open(
            '/healthz',
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    import unittest
    unittest.main()
