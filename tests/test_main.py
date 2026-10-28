from app.main import app


def client():
    app.config["TESTING"] = True
    return app.test_client()


def test_index_returns_version():
    res = client().get("/")
    assert res.status_code == 200
    assert "version" in res.get_json()


def test_health():
    res = client().get("/health")
    assert res.status_code == 200
    assert res.get_json() == {"status": "ok"}
