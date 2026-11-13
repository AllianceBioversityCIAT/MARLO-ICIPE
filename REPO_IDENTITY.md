# Repository Identity — MARLO-ICIPE

Read this before reasoning about programs, terminology or deployments in this checkout. Most documentation in this
repository is inherited unchanged from `CCAFS/MARLO`. **The repository name does not name the program it serves:
this repository deploys FSRP.**

---

## 1. What this repository is

| Item | Value |
|---|---|
| Repository | `AllianceBioversityCIAT/MARLO-ICIPE` |
| Relationship | Fork of `CCAFS/MARLO` (remote `upstream`). Product changes land first in `CCAFS/MARLO` `staging` and arrive here by merging `upstream/staging` into this repository's `staging` |
| Program served | **FSRP** (also written *AICCRA FSRP* or *AICCRA-FSRP IV* in issues and specs) |
| Global Unit | Acronym **`AICCRA_FSRP`** |
| `crp_custom_file` | **`aiccra3`** → labels come from `marlo-web/src/main/resources/custom/aiccra3.properties` on top of `global.properties` |

---

## 2. Terminology

FSRP uses `custom/aiccra3.properties`, the same file as the AICCRA 3 program:

| Internal name (code / data) | Shown in FSRP |
|---|---|
| `Project` | Technical Implementation Team |
| `CrpProgram` (flagship) | Component |
| Flagship leader role | Component Leader |
| PMU / program management role | Secretariat / PIU |
| `CrpMilestone` | Year Target |
| `GlobalUnit` (plural label) | PTFs |
| Impact Pathway section | Overall Performance Indicators |

The full matrix and the traps (for example, *Cluster of Activities* is a different entity from `Project`) are in
[`docs/glossary.md`](./docs/glossary.md).

- When the inherited docs say *Cluster* or *Cluster Coordinator*, read *Project* / *Project Coordinator*; FSRP shows
  it as *Technical Implementation Team*.
- `aiccra3.properties` is shared with the AICCRA 3 program and maintained in `CCAFS/MARLO`: **any change to it
  upstream changes FSRP's labels** after the next merge and deploy. Texts in it that mention AICCRA by name are shown
  to FSRP users as they are.

---

## 3. Branches and deployment

| Branch | A push triggers | Effect |
|---|---|---|
| `staging` | `fsrp-staging-ci.yml` | CI only: image build (not published), Jenkins verification, Slack. **No deploy** |
| `main` | `fsrp-prod-ci.yml` (`dry-run: false`) | **Real FSRP production deploy** (ECR `marlofsrp-app-prod`, Jenkins `marlo-fsrp-main-cd`) |

- Merge `upstream/staging` into **`staging`**, never into `main`. `main` only moves when `staging` is promoted.
- The `CCAFS/MARLO` workflows (`marlo-*.yml`, `jenkins-trigger-java-*.yml`) are deleted in this fork. When an
  upstream merge reports a modify/delete conflict on one of them, resolve it by keeping the deletion.
- `jenkins-trigger.yml` runs only on `workflow_dispatch` (manual recovery through the legacy Jenkins job).
- Any change to `global.properties` or `custom/*.properties` needs an application restart after deploy.

---

## 4. Keeping this file current

- This file exists only in this fork: `CCAFS/MARLO` never has it, so upstream merges never conflict with it.
- Update it when the Global Unit, `crp_custom_file`, the deployment workflows or FSRP's terminology change.
- Do not copy it into `CCAFS/MARLO` or other forks: each fork documents only its own program.
