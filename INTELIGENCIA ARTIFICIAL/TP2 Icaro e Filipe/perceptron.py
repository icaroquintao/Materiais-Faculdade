import random
import pandas as pd
from sklearn.model_selection import train_test_split
import termtables as tt

# Leitura do arquivo .csv (dataset)
df = pd.read_csv("dataset.csv", delimiter=',')
train = train_test_split(df, test_size=0.6)

#Divisao em treino e teste
xtrain = train.iloc[:, :58].values.tolist()
ytrain = train['exit'].tolist()

xtest = test.iloc[:, :58].values.tolist()
ytest = test['exit'].tolist()


class Perceptron:

    # Inicializacao do objeto Perceptron
    def __init__(self, sample, exit, learn_rate=0.8, epoch_number=1000, bias=-1):
        self.sample = sample
        self.exit = exit
        self.learn_rate = learn_rate
        self.epoch_number = epoch_number
        self.bias = bias
        self.number_sample = len(sample)
        self.col_sample = len(sample[0])
        self.weight = []

    # Funcao de Treinamento do Perceptron (Metodo Gradiente Descendente)
    def trannig(self):
        for sample in self.sample:
            sample.insert(0, self.bias)

        # Inicializa os pesos w aleatoriamente
        for i in range(self.col_sample):
            self.weight.append(random.random())

        # Insere peso da entrada de polarizacao(bias)
        self.weight.insert(0, self.bias)

        epoch_count = 0

        # Metodo do Gradiente Descendente para ajuste dos pesos do Perceptron
        while True:
            erro = False
            for i in range(self.number_sample):
                u = 0
                for j in range(self.col_sample + 1):
                    u += self.weight[j] * self.sample[i][j]
                y = self.sign(u)
                if y != self.exit[i]:
                    aux_erro = self.exit[i] - y
                    for j in range(self.col_sample + 1):
                        self.weight[j] = self.weight[j] + self.learn_rate * aux_erro * self.sample[i][j]
                    erro = True
            print('Epoca: \n', epoch_count)
            epoch_count = epoch_count + 1
            # Se parada porepocas ou erro
            if erro == False or epoch_count > self.epoch_number:
                print(('\nEpocas:\n', epoch_count))
                print('------------------------\n')
                break

    def sort(self, sample):
        sample.insert(0, self.bias)
        u = 0
        for i in range(self.col_sample + 1):
            u += self.weight[i] * sample[i]

        y = self.sign(u)

        if y == 0:
            # print(('Sample: ', sample))
            return 0
        else:
            # print(('Sample: ', sample))
            return 1

    # Funcao de Ativacao
    def sign(self, u):
        return 1 if u >= 0 else 0


# Inicializa o Perceptron
network = Perceptron(sample=xtrain, exit=ytrain)

network.trannig()
acerto = 0
erro = 0
cont = 0
acerto0 = 0
acerto1 = 0
erro0 = 0
erro1 = 0

# Calcula os Verdadeiros Positivos, Verdadeiros negativos, Falsos positivos e Flasos negativos
while cont < len(ytest):
    if network.sort(xtest[cont]) == ytest[cont]:
        if ytest[cont] == 0:
            acerto0 += 1
            acerto += 1
        else:
            acerto1 += 1
            acerto += 1
    else:
        if ytest[cont] == 0:
            erro0 += 1
            erro += 1
        else:
            erro1 += 1
            erro += 1
    cont += 1

# mostra resultados
string = tt.to_string(
    [["Erro+", acerto0], ["Acerto+", acerto1], ["Erro-", erro0], ["Acerto-", erro1], ["Tamanho", len(ytest)]],
    header=["Atrib", "Resultados"],
    style=tt.styles.ascii_thin_double,
    alignment="ll",
    # padding=(0, 1),
)






cont = 0

#   Exibe e calcula o Gráfico, acuracia, sensibilidade, e a  especificidade
print(string)
print("Matriz de Confusao:")
print(" 1   2")
print("1", acerto0, acerto1)
print("2", erro0, erro1)

acuracia = (acerto1+acerto0)/(acerto1+acerto0+erro1+erro0)
sensibilidade = acerto0/(acerto0+erro1)
especificidade = acerto1/(acerto1+erro0)

print("Acuracia:")
print(acuracia)

print("Sensibilidade")
print(sensibilidade)

print("Especificidade")
print(especificidade)

print(acerto)
print(erro)
print(len(ytest))
print(xtest)

x = ['0', '50', '100', '150', '200']
plt.plot(x, [200, 400, 600, 800, 1000])
plt.xlabel('Interações')
plt.ylabel('Erro')
plt.title("Erro por tempo")
plt.legend()
plt.show()
