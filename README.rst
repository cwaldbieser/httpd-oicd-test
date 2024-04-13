##############################
 Apache mod_auth_oidc example
##############################

A simple Dockerized Apache2 web server protecting a folder with
mod_auth_oidc.

***************
 Prerequisites
***************

-  Docker

***********************************
 Build and deploy the site locally
***********************************

You need to create a text file, `client_secret.txt` that contains the
client secret. Then:

.. code:: bash

   $ make build
   $ make run

The URL http://localhost:8080/ will display the site index. The
protected sever variables are what is really interesting for this
example so you can learn how to use REMOTE_USER, etc. in your apps.
Below are some examples of some useful OIDC variables:

-  OIDC_CLAIM_acr: mfa-duo

-  OIDC_CLAIM_amr: DuoSecurityAuthenticationHandler

-  OIDC_CLAIM_attributes: {"given_name": "Carl", "family_name":
   "Waldbieser", "email": "waldbiec@example.net", "person_id":
   "L01234567"}

-  OIDC_CLAIM_aud: testsite_client

-  OIDC_CLAIM_auth_time: 1712967823

-  OIDC_CLAIM_client_id: testsite_client

-  OIDC_CLAIM_email: waldbiec@example.net

-  OIDC_CLAIM_exp: 1713004649

-  OIDC_CLAIM_family_name: Waldbieser

-  OIDC_CLAIM_given_name: Carl

-  OIDC_CLAIM_iat: 1712975849

-  OIDC_CLAIM_id: waldbiec

-  OIDC_CLAIM_iss: https://cas.example.net/cas/oidc

-  OIDC_CLAIM_jti:
   TGT-2-MseB9I59rYYW6WN5FIaHeQADUcC-Fl95VxANOezMOGH6-3cAbdM2Ju-1dozU7pQ-eU8-ip-10-2-7-161

-  OIDC_CLAIM_nbf: 1712975549

-  OIDC_CLAIM_nonce: 5ZXwj9xnXMIdH38LYEPNTBjrgE5LgSIZbXbra7kDXFk

-  OIDC_CLAIM_preferred_username: waldbiec

-  OIDC_CLAIM_service:
   http://localhost:8080/protected/redirect_uri

-  OIDC_CLAIM_sid: 47a8b229321ffc8d3afc38aa7b37aec14444daa1

-  OIDC_CLAIM_state: 5_TTeFHnXfpSKU7_n2Nj8Sdhdk0

-  OIDC_CLAIM_sub: waldbiec

-  OIDC_access_token: AT-15-IaworiRLvX6VvZnTQzZzn1uoUkBYGzBM

-  OIDC_access_token_expires: 1713004649

-  REMOTE_USER: waldbiec@cas.example.net/cas/oidc
