About
=====
Project to deploy wordpress site to AWS

Issues
======
- Database not connecting

Resolved
========
- chef not validating ssh. Wrong AMI. Fixed
- Mod ssl incompatible version with apache, removed ssl mod

SSH to AWS Machine
==================
If created with TF Creds, accessing instance via ssh will use TF creds
