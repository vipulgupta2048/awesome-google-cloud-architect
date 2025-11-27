# GitHub Copilot Instructions

This repository contains comprehensive Google Cloud Professional Cloud Architect (PCA) certification study materials organized as an interconnected knowledge base using Obsidian.

## Repository Architecture

### Core Structure
- **Knowledge Base Design**: Built for Obsidian with bi-directional linking using `[[Note Name]]` syntax
- **Hierarchical Organization**: Main topics → Concepts → Case Studies → Practice Materials
- **Cross-Referenced Learning**: Topics are interconnected rather than siloed, reflecting real GCP architectures

### Key Directories
- `Concepts/` - Core GCP service deep-dives with technical implementation details
- `case studies/` - Real-world scenarios from official exam case studies (Helicopter Racing League, EHR Healthcare, Mountkirk Games, TerramEarth)
- `Labs/` - Hands-on practice exercises and configurations
- `Revision/` - Condensed review materials and exam-focused summaries
- `images/` - Visual diagrams, architecture screenshots, and technical illustrations

## Project-Specific Conventions

### Linking Patterns
- **Internal Links**: Always use `[[File Name]]` format without .md extension
- **Index Files**: Each major directory has a `0 - index` file listing all related topics
- **Cross-References**: Topics reference related concepts extensively (e.g., networking concepts link to security, IAM, and compliance topics)

### Content Organization
- **Technical Depth**: Files balance theoretical concepts with practical implementation details
- **Exam-Oriented**: Content prioritizes topics that frequently appear in the actual PCA exam
- **Real-World Context**: Technical concepts are explained through case study applications

### File Naming Convention
- Descriptive names with service prefixes: `G Cloud Load balancing.md`, `G Kubernetes Engine.md`
- Index files: `0 - index [category].md`
- Case studies maintain official names: `Helicopter Racing League Case Study.md`

## Development Workflows

### Content Validation
- Use `scripts/check-links.sh` to validate internal `[[links]]` across the knowledge base
- Script performs case-insensitive searches and checks subdirectories for broken references

### Quality Standards
- **Accuracy**: Content reflects actual exam experience (exam passed Sept 22, 2025)
- **Completeness**: Major topics covered include networking, security, IAM, CI/CD, GKE, storage solutions
- **Practical Focus**: Concepts explained with implementation examples and architectural decisions

## Critical Knowledge Areas

### High-Impact Topics (Based on Actual Exam)
- **Case Studies**: 12+ questions directly from official case studies - these require deep architectural thinking
- **GKE Technical Details**: Liveness/readiness probes, scaling strategies, multi-cluster ingress
- **Networking Architecture**: VPC design, load balancer selection, interconnect options, IAP implementation
- **CI/CD Pipelines**: Cloud Build configurations, vulnerability scanning, binary authorization workflows
- **Storage Strategy**: GCS types, BigQuery vs BigTable selection criteria, disaster recovery patterns

### Cross-Service Integration Patterns
- **Security-First Design**: IAM roles, Cloud Armor, DLP integration across services
- **Monitoring Strategy**: Cloud Operations, error reporting, log aggregation patterns
- **Cost Optimization**: Resource right-sizing, managed vs unmanaged services trade-offs

## Usage Guidelines

### For Content Updates
- Maintain Obsidian compatibility - test links work in graph view
- Update index files when adding new topics
- Cross-reference related concepts to maintain knowledge graph integrity
- Add visual aids to `images/` folder for complex architectural concepts

### For Contributors
- Follow the established linking pattern for knowledge base consistency
- Ensure technical accuracy - content should reflect current GCP best practices
- Maintain exam relevance - prioritize topics that appear in certification scenarios
- Reference official case studies when explaining architectural decisions

## External Dependencies

- **Obsidian**: Primary tool for viewing and navigating the knowledge base
- **Markdown Compatibility**: Content works in standard markdown editors but linking features require Obsidian
- **GitHub**: Version control and collaboration platform
- **License**: CC BY-NC-ND 4.0 - non-commercial, attribution required

When working with this codebase, focus on maintaining the interconnected nature of the knowledge base while ensuring technical accuracy and exam relevance.
