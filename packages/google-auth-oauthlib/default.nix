{ lib, python3Packages, fetchurl }:

python3Packages.buildPythonPackage rec {
  pname = "google-auth-oauthlib";
  version = "0.2.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "226d1d0960f86ba5d9efd426a70b291eaba96f47d071657e0254ea969025728a";
  };

  meta = with lib; {
    homepage = https://github.com/GoogleCloudPlatform/google-auth-library-python-oauthlib;
    description = "Google Authentication Library";
    license = licenses.apache2;
    platforms = platforms.all;
  };

  checkInputs = with python3Packages; [
    click
    mock
    pytest
  ];

  propagatedBuildInputs = with python3Packages; [
    google_auth
    requests_oauthlib
  ];
}