###############################################################################
###  Resets CloudFront cache with boto/cfadmin utility
###  Run: ./this_script
###############################################################################

#
# Travis specific part - run this script only for production
#

# If this is fork - just exit
if [[ -n "${TRAVIS_PULL_REQUEST}" && "${TRAVIS_PULL_REQUEST}" != "false"  ]]; then
  echo -e '\n============== deploy will not be started (from the fork) ==============\n'
  exit 0
fi

if [[ $TRAVIS_BRANCH == 'master' ]]; then
    echo -e "\nThis is master/production branch - let's reset the CloudFront cache\n"
else
    echo -e "\nReset of CloudFront cache will not be started for non-production branch - exit.\n"
    exit 0
fi

#
# Install boto
#
echo -e "\nInstalling boto...\n"
git clone git://github.com/boto/boto.git
cd boto
sudo python setup.py install
cd ../
rm -rf boto

#
# Set up credentials for boto
#
echo -e "\nSet up boto credentials...\n"
echo "[Credentials]" > ~/.boto
echo "aws_access_key_id = H1ht8YckYuuDsroCPWPzm6LqRCKOmuwlTMWckuqd3ydPyLqRr732ybVIxlwgXDzCIE302jzTMeccyE/+pfhrSwy3K/UrptyXhLLGLQBLDnL3pTsTgdz03AG1AhUhtap/zEX6Ek81WOZKQwO5MbgOAsplo+qbsyByHn6Bgn2hrUw= " >> ~/.boto
echo "aws_secret_access_key = cCvPHas8TVNLPpY1w13vTytU5A04gjC6FQyQmccW1mGNOvxnVLb6+YRELlT9QB5XS1xUHPiNqmn4XqduyBbV1ib/30h6w6TAtFNalklGiDJ/jHo6ic8+yVtL0xjbUDbvniaEx7ShI64Y3vPtjlI6Da4xfSC2tEGMa50zTlE+vvk=" > ~/.boto

echo -e "\nCloudFront Invalidating...\n"
cfadmin invalidate E3D9ROOEA76369 /index.html
echo -e "\nInvalidating is in progress...\n"
echo -e "\nYou can check the status on the 'Invalidations' tab here https://console.aws.amazon.com/\n"

#
# Clean up
#
echo -e "\nRemove boto config file\n"
rm ~/.boto
