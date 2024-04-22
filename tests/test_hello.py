def test_hello_world(client):
    res = client.get('/')
    assert res.status_code == 200
