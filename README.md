A Ruby toolset for validating bank account details, including:
* IBAN (International Bank Account Number)
	* Mod-97 check (ISO 7064)
	* Length check by country
	* TODO: Format check by country
	* TODO: Generation from bank code, account number and country
* SWIFT-BIC
	* Format check
* ABA Code
  * Length check
	* Check digit validation
* Credit card
	* TODO: Format check by card type
	* TODO: Luhn algorithm
* Creditor Identifier (see http://wiki.xmldation.com/Support/NVB/Creditor_Identifier_for_NVB)
	* TODO: Mod-97 check (ISO 7064)
