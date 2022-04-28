# socks5

Fiz esse pequeno script para ajudar as pessoas que tem dificuldade em subir um socks5 que funcione com o Axiom.

Para executar, basta dar permissão de execução para o script:

```
chmod +x proxy.sh
```
Depois
```
./proxy.sh
```
Feito isso o proxy pode ser utilizado da seguinte forma:

```
proxychains curl ifconfig.me
```

Dessa forma ele usará o proxychains para selecionar por qual proxy passar.

Ou chamando diretamente com o ip do seu servidor

```
curl --proxy socks5://bugbounty:MeuPasswordSinistro@IP_DO_SEU_SERVIDOR_NA_DIGITAL_OCEAN_POR_EXEMPLO:1080 https://ifconfig.me
```

Alterem como quiser, isso são apenas idéias!

# axiom-socks5

Se você precisa definir o numero de proxys que você deseja utilizar, baixe a ferramenta axiom-socks5 para o diretório

```
/root/.axiom/interact/
```

Você pode fazer dessa forma:
```
wget https://raw.githubusercontent.com/gustavorobertux/socks5/main/axiom-socks5 -O /root/.axiom/interact/
```

Para utilizar basta proceder da seguinte forma:

```
axiom-socks5 N
```
Onde N é o número de socks5 que você vai precisar.
