# Film Developer Parameter Estimation

MATLAB script for estimation of film/developer combination development times based on given combination samples.

## Operation

Using given temperature and sensitivities, this script approximates the function `time(sensitivity)` using logarithmic fitting by finding optimum values `alpha` and `beta` such that 

    time(sensitivity) = sensitivity^alpha + 10^beta 

## License

Copyright &copy; 2013-2014 Markus Mayer

Film Developer Parameter Estimation is licensed under the EUPL, Version 1.1 or - as soon they will be approved by the European Commission -
subsequent versions of the EUPL (the "Licence"); you may not use this work except in compliance with the Licence.
You may obtain a copy of the Licence at:

[http://joinup.ec.europa.eu/software/page/eupl/licence-eupl](http://joinup.ec.europa.eu/software/page/eupl/licence-eupl)

Unless required by applicable law or agreed to in writing, software distributed under the Licence is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the Licence for the specific language governing permissions and limitations under the Licence.