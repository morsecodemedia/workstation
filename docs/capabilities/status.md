# Configuration Management - Status

## Purpose

Status reports the current state of Workstation-managed configuration.

Status performs no modifications.

It is a read-only operation.

---

## Responsibility

Determine which managed configuration is currently deployed.

---

## Inputs

- Repository configuration
- User environment

---

## Outputs

A structured status report describing:

- Managed configuration
- Missing configuration
- Modified configuration
- Unmanaged files

---

## Does Not Own

- Deployment
- Removal
- Verification

Status reports state.

It does not change state.

---

## Success Criteria

Status accurately reflects the current deployment state.

---

## Consumers

- Bootstrap
- Verification
- Users
- Future automation

---

## Future

Potential future enhancements:

- JSON output
- Machine-readable output
- Colorized terminal output
- Quiet mode