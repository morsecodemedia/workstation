# Bootstrap Capability

## Purpose

Bootstrap prepares a supported machine to become a fully configured Workstation.

Bootstrap is an orchestration capability.

It does not directly perform installation tasks.

---

## Responsibility

Coordinate the execution of workstation capabilities in the correct order.

---

## Inputs

- User request
- Platform information
- Configuration

---

## Outputs

- Configured workstation
- Verification report

---

## Delegates To

- Platform Detection
- Prerequisite Validation
- Package Management
- Configuration Deployment
- Verification

---

## Does Not Own

- Package installation
- Symlink creation
- Shell configuration
- Git configuration

Those belong to lower-level capabilities.

---

## Success Criteria

Bootstrap completes successfully when every delegated capability succeeds and verification passes.

---

## Future

Support partial bootstrap.

Support capability-specific bootstrap.

Support recovery mode.
