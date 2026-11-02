# Terraform AWS 인프라 실습

Terraform을 사용해 AWS 네트워크와 EC2 인프라를 코드로 구성하는 개인 학습 프로젝트입니다.

## 목표

- AWS 콘솔에서 구성했던 네트워크를 Terraform 코드로 재현
- Terraform의 초기화, 실행 계획, 적용 및 상태 관리 이해
- 인프라 구성 과정과 발생한 문제를 기록

## 사용 기술

- Terraform
- AWS VPC 및 EC2
- AWS CLI와 IAM Identity Center
- Git / GitHub

## 진행 상황

- [x] Terraform 및 AWS CLI 설치
- [x] IAM Identity Center와 AWS CLI SSO 프로필 설정
- [x] AWS provider 초기화
- [x] Terraform으로 VPC 생성 및 콘솔 확인
- [x] 서브넷 생성
- [x] 인터넷 게이트웨이 및 라우팅 구성
- [ ] 보안 그룹 및 EC2 구성

## 현재 구성

- 리전: 서울 (`ap-northeast-2`)
- VPC CIDR: `10.0.0.0/16`
- VPC 이름: `terraform-lab-vpc`
- 서브넷 CIDR: `10.0.1.0/24`
- 인터넷 게이트웨이 연결
- 퍼블릭 라우팅: `0.0.0.0/0` → 인터넷 게이트웨이

## 문제 해결 기록

### Terraform provider 다운로드 연결 오류

- **상황:** 최초 `terraform init` 실행 중 AWS provider 버전 목록을 가져오다가 연결이 끊김.
- **조치:** 같은 명령어를 다시 실행해 초기화에 성공.
- **확인된 내용:** 일시적인 연결 오류였을 가능성은 있지만, 정확한 원인은 확인하지 못함.

## 보안

- Terraform 상태 파일과 개인 설정 파일은 Git에 포함하지 않습니다.
- AWS 인증에는 IAM Identity Center의 임시 인증 정보를 사용합니다.