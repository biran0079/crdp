# Runbook for distribution
```
rm dist/*
python3 setup.py sdist bdist_wheel
python3 -m twine upload dist/*
```

# Development
```
python3 setup.py build_ext --inplace
```
