## Public Interface

Workstation provides the primary command-line interface for the MCU.

The CLI is the public interface of the ecosystem.

Users interact with Workstation rather than individual repositories.

Workstation is responsible for:

- Command discovery
- Command routing
- User experience
- Delegation

Repositories implement capabilities.

Workstation delegates requests to the appropriate repository while maintaining a consistent user interface.

This separation allows repository implementations to evolve independently without affecting the public CLI.
