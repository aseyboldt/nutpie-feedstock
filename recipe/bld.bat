set "PYO3_PYTHON=%PYTHON%"

maturin build -v --jobs 1 --bindings pyo3 --release --manylinux off --interpreter=%PYTHON%
if errorlevel 1 exit 1

FOR /F "delims=" %%i IN ('dir /s /b target\wheels\*.whl') DO set nutpie_wheel=%%i
%PYTHON% -m pip install --ignore-installed --no-deps %nutpie_wheel% -vv
if errorlevel 1 exit 1

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
