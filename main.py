def base2base(valor, baseS, baseD):
    # Convertir a base 10
    decimal = 0  # Se crea para almacenar el valor en base 10
    potencia = 0 # Llevamos la cuenta de la potencia a la que se eleva el parametro "baseS"
    for digito in reversed(str(valor)): # Se recorre cada dígito del número en orden inverso porque empieza por la unidades
        decimal += int(digito) * (baseS ** potencia) # Se va sumando el valor en base 10, multiplicando cada dígito por la potencia de la base correspondinte.
        potencia += 1 # despues se incrementa la potencia para pasar el siguiente digito

    # Convertir de base 10 a la base deseada
    nuevo_valor = '' # almacena el nuevo valor en la base deseada
    while decimal > 0:
        nuevo_valor = str(decimal % baseD) + nuevo_valor  # Se realiza una division entrea de decimal entre baseD y se concatena a 'nuevo_valor'
        decimal //= baseD # actualizamos el decimal dividiendo entre baseD

    return int(nuevo_valor) if nuevo_valor else 0 # Se devuelve el nuevo valor en la base deseada como un entero. Si nuevo_valor es una cadena vacía se devuelve 0.

# Menu
while True:
    print("1. Utilizar el programa.")
    print("2. Salir.")
    opcion = int(input("Ingrese la opcion deseada: "))

    if opcion == 1:
        valor = int(input("Ingrese el valor que desea convertir: "))
        baseS = int(input("Ingrese la base numérica en la que está "))
        baseD = int(input("Ingrese la base numérica a la que desea convertir "))
        conversion = base2base(valor, baseS, baseD)

        print(f"El numero que desea convertir es: {valor}")
        print(f"La vase numerica en la que esta escrito el valor es: {baseS}")
        print(f"La vase numerica hacia la que se desea realizar la conversion es: {baseD}")
        print(f"La conversion es: {conversion}")

    elif opcion == 2:
        print('Salir')
        break

    else:
        print('Ingrese un valor correcto!')
        continue

