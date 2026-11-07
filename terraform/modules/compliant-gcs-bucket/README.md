# Compliant Google Cloud Storage Bucket

This Terraform module creates a Google Cloud Storage bucket with a customer-managed encryption key and 90-day key rotation (SC-12, SC-13, SC-28). It enforces uniform bucket-level access, blocks public access (AC-3), enables object versioning, and applies required labels (CM-6). It also configures object retention (AU-11) and rejects production configurations with fewer than 365 days of retention.

In Lab 2.4, I deployed the dev configuration with 30-day retention and verified the bucket settings and key rotation directly in Google Cloud. Terraform accepted the 365-day production plan and rejected the 30-day production test. Both production checks were plan-only.
