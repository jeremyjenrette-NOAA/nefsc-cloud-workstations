# NEFSC Google Cloud Workstation Onboarding & Operations

Welcome to the NOAA Northeast Fisheries Science Center (NEFSC) Google Cloud Platform (GCP) Workstation repository. This repository provides guidance, operational scripts, and infrastructure configuration templates to help NEFSC personnel transition their programmatic workflows to Google Cloud.

## Disclaimer

This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.

## Quick Start

### 1. Connecting to a Workstation via Terminal
Execute the connection script to SSH into your assigned workstation:
```bash
./scripts/connect.sh -w jeremy-dev-ws -m ssh
