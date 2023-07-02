--sintaxe

CREATE FUNCTION somefunction(integer, text) RETURNS integer
AS 'function body text'
LANGUAGE plpgsql;

-- use void for functions thats returns nothing

-- write the function body

-- start the body with $$

$$
DECLARE 
	-- VARIABLES DECLARATION

BEGIN
	-- INICIO DA IMPLEMENTAÇÃO

END;

$$ LAGUAGE plpgsql

--exemples of variables declaration
DECLARE
	user_id integer;
	preco	numeric;
	url	varchar;
	minhalinha nometabela%ROWTYPE;
	meucampo nometabela.nomecoluna%TYPE;
	quantidade integer DEFAULT 32;
	uri varchar := 'http://mysite.com';
	k CONSTANTE integer := 10;



-- is possible not declare a name for the params in functions.

CREATE FUNCTION aplicaTaxa(real,real)
RETURNS real AS
$$
BEGIN
	RETURN($1 + $2) * 0.06;

END;
$$ LANGUAGE plpgsql;

-- $1 is the first param and $2 is the second param in sequency


-- the params can be specify using an alias.

CREATE FUNCTION aplicaTaxa(real, real)
RETURNS real AS
$$
DECLARE
	valor1 ALIAS FOR $1;
	valor2 ALIAS FOR $2;

BEGIN 
	RETURN (valor1+valor2)* 0.65;

END;
$$ LANGUAGE plpgsql;
