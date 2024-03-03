IMAGE="c15_julia_lambda"
TAG="0.1.0"
FUNC_NAME="c15_julia_lambda"
IMAGE_REGISTRY=""
IMAGE_URI="${IMAGE_REGISTRY}/${IMAGE}:${TAG}"

docker-build:
	docker build -t ${IMAGE}:${TAG} .

docker-push:
	docker push ${IMAGE_URI}

ecr-create:
	aws ecr create-repository --repository-name "${FUNC_NAME}"

ecr-read:
	aws ecr describe-repositories --output yaml 2>&1 |grep "repositoryName: ${FUNC_NAME}$" >/dev/null

lambda-update:
	aws lambda update-function-code --function-name ${FUNC_NAME} --image-uri ${IMAGE_URI} --publish

lambda-read:
	aws lambda get-function-configuration --function-name ${FUNC_NAME} --output yaml 2>&1|grep FunctionName
