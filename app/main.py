import os
import socket

from flask import Flask, jsonify

app = Flask(__name__)

# CI/CD에서 이미지 빌드 시 커밋 SHA를 넣어 준다. 배포 후 새 버전이 떴는지 확인하는 용도.
APP_VERSION = os.environ.get("APP_VERSION", "local")


@app.get("/")
def index():
    return jsonify(
        message="Hello from cloud-portfolio",
        version=APP_VERSION,
        # ECS에서 태스크가 여러 개일 때 어느 컨테이너가 응답했는지 보여 준다.
        host=socket.gethostname(),
    )


@app.get("/health")
def health():
    # ALB 대상 그룹 헬스체크 경로
    return jsonify(status="ok")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
