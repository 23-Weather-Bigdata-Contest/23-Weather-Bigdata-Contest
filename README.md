# 23-Weather-Bigdata-Contest
기상청 주최 **2023 날씨 빅데이터 콘테스트** 의 "기상에 따른 계절별 지면온도 산출 기술 개발" 분야에서 기상청장상(2등)을 수상한 프로젝트 관련 repository 입니다.

## 서론 : 공모 배경 및 분석 목표
지면온도란 지표면 부근에서 측정한 온도로 시각과 계절에 따른 차이 뿐만 아니라 기상이나 지표면의 상태에 따라 일사의 흡수, 장파복사, 대기와의 열 교환 등이 현저히 다르므로 시공간적인 차이가 크게 나타날 수 있는 기상요소입니다. 
여름철 기온은 34.7도 임에도 불구하고 노지의 지면온도는 51.3도까지 오른 사례와 아침 기온은 영상권을 회복했음에도, 지면 온도가 영하권에 머물면서 도로가 살얼음판이 되었다는 뉴스를 통해 실생활에서 지면온도에 대한 고려가 요구된다는 것을 알 수 있었습니다.
특히 기온 관측 지점에 비해 지면온도는 훨씬 적은 지점에서 관측되고 있어 기상자료를 활용한 지면온도 추정 기술이 요구되기 때문에 해당 분석이 필요성을 느꼈습니다.

따라서 기상청에서 주어진 10개 지점에 대한 11개의 기상 관측 데이터를 활용하여 새로운 지점의 지면 온도를 예측하는 **계절별 지면온도 총합 산출 모델** 개발하고자 합니다.

## 데이터 정의
<img width="734" alt="2  데이터설명" src="https://github-production-user-asset-6210df.s3.amazonaws.com/128279811/282522447-c431fea2-71a1-4b0b-840a-e3fc82007689.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240415%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240415T155349Z&X-Amz-Expires=300&X-Amz-Signature=14892882a510e5dea1a69dd8fbbc94b06848af578314f89b8bf3016aaa228a72&X-Amz-SignedHeaders=host&actor_id=81362412&key_id=0&repo_id=718203960">

## 결측값 처리
분석자료를 참고해주세요
## 이상값 및 범주형 변수
분석자료를 참고해주세요

## 분석 기법(모델링) 소개
최종 모델 선정 전 머신러닝, 딥러닝의 다양한 모델을 시도해보았습니다.
<img width="845" alt="4  모델1" src="https://github-production-user-asset-6210df.s3.amazonaws.com/128279811/282522704-0a0c3595-e50c-4dbc-a3e0-a9b9d682ff39.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240415%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240415T155411Z&X-Amz-Expires=300&X-Amz-Signature=8988454352f2bb9766e3b86275f05f2e0a13092f11012bb677bd3821238735a7&X-Amz-SignedHeaders=host&actor_id=81362412&key_id=0&repo_id=718203960">

<img width="818" alt="4  모델2" src="https://github-production-user-asset-6210df.s3.amazonaws.com/128279811/282522809-3c247641-ef75-4cff-babb-0f731d9e64cb.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240415%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240415T155433Z&X-Amz-Expires=300&X-Amz-Signature=907b1cfe32bf23246db416995eb631e52f7b920338cbc72b12b473248ff09ded&X-Amz-SignedHeaders=host&actor_id=81362412&key_id=0&repo_id=718203960">

## 최종 선정 모델 선정
* 해당 논문을 통해 정형데이터에는 딥러닝 보다는 tree계열을 모델이 우수함을 알게 되었습니다.
Léo Grinsztajn, Edouard Oyallon, Gaël Varoquaux , Why do tree-based models still outperform deep learning on typical tabular data? (2022)

이를 반영하여 아래의 두가지 모델을 최종 모델로 선정하게 되었습니다. 
<img width="740" alt="5  최종모델2" src="https://github-production-user-asset-6210df.s3.amazonaws.com/128279811/282522809-3c247641-ef75-4cff-babb-0f731d9e64cb.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240415%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240415T155506Z&X-Amz-Expires=300&X-Amz-Signature=dd90d52748f117aa7112c9f16f093bba8cc12ed572a7df6a2822b11cdbe215e1&X-Amz-SignedHeaders=host&actor_id=81362412&key_id=0&repo_id=718203960">

<img width="761" alt="5  최종모델1" src="https://github-production-user-asset-6210df.s3.amazonaws.com/128279811/282523426-48bf2b40-83d2-4822-acc8-3c9110e61e76.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240415%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240415T155528Z&X-Amz-Expires=300&X-Amz-Signature=c8c1e28e739685ad97be39cd0c2eb57c7dd467e380fcca5cb3ab55d2a7d52ee1&X-Amz-SignedHeaders=host&actor_id=81362412&key_id=0&repo_id=718203960">

- 계절별 성능 비교
<img width="751" alt="6  최종모델" src="https://github-production-user-asset-6210df.s3.amazonaws.com/128279811/282523638-06c9f0cf-bac5-4d47-aec6-93a20221159e.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240415%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240415T155548Z&X-Amz-Expires=300&X-Amz-Signature=3826afa478225af04dc4dfc0765e53967d62d68474c79a7c299e9c5a96d9b8e9&X-Amz-SignedHeaders=host&actor_id=81362412&key_id=0&repo_id=718203960">

## 활용방안
<img width="775" alt="7  활용방안" src="https://github-production-user-asset-6210df.s3.amazonaws.com/128279811/282523774-7f91751f-127b-4a8f-a3aa-90d247f6fa21.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240415%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240415T155610Z&X-Amz-Expires=300&X-Amz-Signature=62323b9cc261bc40f6873c015e62964bf048178d4808aaf8d06c6e6f6777e6e2&X-Amz-SignedHeaders=host&actor_id=81362412&key_id=0&repo_id=718203960">

분석 자료를 확인해주세요

