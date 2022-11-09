---Marcus Vinicius Emanuel Pereira
---12121BSI244

module Main (main) where
import System.IO
main :: IO()
main = do
     hSetBuffering stdout NoBuffering
     putStrLn("--------------------------------------------")
     putStrLn("\n\n            BEM VINDO AO BANCO\n               DA COMPUTAÇÃO LTDA\n\n")
     putStrLn("--------------------------------------------")

     putStrLn("DO QUE VOCÊ PRECISA?\n")
     putStrLn("(1)SALDO\n(2)EXTRATO\n(3)DEPOSITO\n(4)SAQUE\n(5)FIM\n\ndigite o numero correspondente: ")
     opcao <- readLn
     case opcao of
       1 -> do putStrLn("Aqui o seu saldo: "); imprime "saldo.txt"
       2 -> do putStrLn("Aqui o seu extrato: "); imprime "extrato.txt"
       3 -> do {putStrLn("\n\nQual o valor do deposito?"); valor <- readLn; deposito valor}
       4 -> do {putStrLn("\n\nQual o valor do saque?"); valor <- readLn; saque valor}
       5 -> do putStrLn("\nOBRIGADO POR USAR O BANCO")
       _ -> main

      


imprime :: String -> IO()
imprime path = do
    content <- readFile path

    putStr content
    putStrLn("\n--------------------------------------------")


deposito :: Float -> IO()
deposito saldo = do
    saldo' <- readFile "saldo.txt"
    putStrLn("\n\nSaldo anterior: ")
    putStr saldo'
    writeFile "saldo.txt" (show(read saldo' + saldo))
    saldo' <- readFile "saldo.txt"
    putStrLn("\n\nNovo saldo: ")
    putStrLn saldo'
    appendFile "extrato.txt" ("+"++(show saldo)++"\n")

saque :: Float -> IO()
saque saldo = do
    saldo' <- readFile "saldo.txt"
    putStrLn("\n\nSaldo anterior: ")
    putStr saldo'
    writeFile "saldo.txt" (show(read saldo' - saldo))
    saldo' <- readFile "saldo.txt"
    putStrLn("\n\nNovo saldo: ")
    putStrLn saldo'
    appendFile "extrato.txt" ("-"++(show saldo)++"\n")
    






