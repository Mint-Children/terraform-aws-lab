# Terraform AWS 인프라 실습

Terraform으로 AWS VPC와 Public·Private Subnet을 구성하고, Public Subnet의 EC2에 Nginx를 배포한 개인 실습입니다.

## 실습 내용

- Amazon Linux 2023 AMI를 조회해 기존 Public Subnet에 `t3.micro` EC2를 생성했습니다. `user_data`로 첫 부팅 시 Nginx를 설치하고, 외부 HTTP 접속을 확인했습니다.
- 보안 그룹의 TCP 80 허용 규칙을 제거한 뒤 새 HTTP 연결이 차단되는 것을 확인했습니다.
- Private Subnet에 별도 라우팅 테이블을 연결했습니다. AWS CLI로 Public에는 `0.0.0.0/0 → Internet Gateway` 경로가 있고, Private에는 VPC 내부 통신용 `local` 경로만 있는 것을 확인했습니다.

## 문제 해결 기록

| 문제 | 확인 및 해결 |
| --- | --- |
| `terraform init` 중 AWS Provider 다운로드 연결이 끊겼습니다. | 같은 명령을 다시 실행해 초기화했습니다. 연결이 끊긴 원인은 확인하지 못했습니다. |
| `user_date` 설정에서 `Unexpected attribute` 오류가 발생했습니다. | 오류 메시지에 나온 인수 이름을 확인하고 `user_data`로 수정했습니다. |
| `terraform validate`에서 `user-data.sh`를 찾지 못했습니다. | 코드의 경로와 실제 파일 목록을 비교했습니다. `user-date.sh`를 `user-data.sh`로 변경한 뒤 검사를 통과했습니다. |
| 보안 그룹의 `ingress` 블록을 주석 처리했는데 `terraform plan`에서 `No changes`가 나왔습니다. | `ingress = []`로 인바운드 규칙이 없는 상태를 명시했습니다. 실행 계획에서 TCP 80 허용 규칙이 제거되는 것을 확인한 뒤 적용했습니다. |