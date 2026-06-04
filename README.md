# Дипломная работа профессии "DevOps-инженер"

---
## Этапы выполнения :

1. Подготовить облачную инфраструктуру на базе облачного провайдера Яндекс.Облако (dir: iac-teraform).
2. Запустить и сконфигурировать Kubernetes кластер (dir: iac-teraform).
3. Установить и настроить систему мониторинга (dir: monitoring).
4. Настроить и автоматизировать сборку тестового приложения с использованием Docker-контейнеров (dir: app, registry).
5. Настроить CI для автоматической сборки и тестирования (dir: app).
6. Настроить CD для автоматического развёртывания приложения (dir: app).

---
### Создание облачной инфраструктуры

Dir: iac-terraform
Description: данная дирректория служит для развертывания облачных ресурсов, начиная от сервисного аккаунта, заканчивая полноценным Kubernetes кластером. В нем отсутствует .gitlab-ci.yml для внимательного отслеживания состояния облачной инфраструктуры при внесении изменений, посредством `terraform plan`. 

---
### Создание Kubernetes кластера

Dir: iac-terraform
Description: конфигурация Kubernetes кластера описывается в файлах `k8s-master.yml` и `k8s-nodegroup.tf`. В первом файле описывается региональный мастер в трех разных зонах, во втором файле описывается нод группа состоящая из 3 узлов в разных подсетях.

---
### Создание тестового приложения

Dir: registry
Description: простой регистри для образов, куда складываются артефакты билдов. Процесс деплоя посредством `helm` описан в `.gitlab-ci.yml`.

Dir: app
Description: простое приложение на пайтоне (image: `python:3.11-slim`). CI/CD описан в `.gitlab-ci.yml` состоящий из двух стадий `build` и `deploy`. В первой стадии собирается образ посредством `docker` и пушится в `registry`. Во второй стадии подставляется тэг под образ и указывается в поле `deploy.image` файла `./helm-application/values.yaml` и посредством `helm` деплоится в Kubernetes кластер.

---
### Подготовка cистемы мониторинга и деплой приложения

Dir: monitoring
Description: используется `kube-prometheus-stack` для развертывания средств мониторинга: `prometheus`, `alertmanager`, `grafana` и `node-exporter`. Также описан в `.gitlab-ci.yml` простенький пайплайн для деплоя стека посредством `helm`.

---
## Решение:

<img width="974" height="656" alt="terraform-1" src="https://github.com/user-attachments/assets/2affcc0c-97f6-4ac0-8b31-9ad0a936b2e5" />
<img width="638" height="668" alt="terraform-2" src="https://github.com/user-attachments/assets/33c1e8bb-6874-48cc-91e4-cf4337a5b929" />
<img width="638" height="732" alt="terraform-3" src="https://github.com/user-attachments/assets/41cf1f4b-320b-47a2-8c82-7d2bc87d0793" />
<img width="638" height="136" alt="terraform-4" src="https://github.com/user-attachments/assets/1715b60b-e1f1-4758-a694-efa81acf02b3" />
<img width="640" height="414" alt="terraform-5" src="https://github.com/user-attachments/assets/2ee14c16-3e4f-4e60-97d1-93967bd9c009" />
<img width="638" height="84" alt="terraform-6" src="https://github.com/user-attachments/assets/222eb051-82f6-456e-bec4-e0bca9cc5e9b" />
<img width="640" height="748" alt="terraform-7" src="https://github.com/user-attachments/assets/7045b749-6fb3-4cda-8b3b-d80a6104cfbb" />
<img width="636" height="136" alt="terraform-8" src="https://github.com/user-attachments/assets/1d3b141a-f5a0-4134-a9a2-95dca1527814" />
<img width="642" height="554" alt="terraform-9" src="https://github.com/user-attachments/assets/b9f798c0-86f1-471c-b662-6667ed37da60" />
<img width="640" height="330" alt="terraform-10" src="https://github.com/user-attachments/assets/d28f0b2f-fdcb-472e-9c79-07a61b6805a3" />

<img width="970" height="582" alt="repo-app-1" src="https://github.com/user-attachments/assets/75513972-cb7f-4960-85ae-d87f3ef69388" />
<img width="958" height="674" alt="repo-app-2" src="https://github.com/user-attachments/assets/fb413e4a-8cb2-4b22-b0c2-335915a2cdc6" />
<img width="1276" height="280" alt="repo-app-3" src="https://github.com/user-attachments/assets/7cad4606-824f-4337-a0e2-0a89ca9f1f17" />
<img width="1600" height="776" alt="repo-app-4" src="https://github.com/user-attachments/assets/a48f2191-36c7-48b0-9a35-45442b88c62a" />
<img width="1602" height="746" alt="repo-app-5" src="https://github.com/user-attachments/assets/a2b55fc4-085e-4610-9134-f0033e04fe2b" />

<img width="638" height="668" alt="k8s-master" src="https://github.com/user-attachments/assets/8dcb90d5-5aff-446c-a74f-a953adb5489f" />
<img width="638" height="732" alt="k8s-node-group" src="https://github.com/user-attachments/assets/950d2957-97b7-430d-ba39-cbf10c22758e" />

<img width="1148" height="398" alt="app-pods" src="https://github.com/user-attachments/assets/25f13853-6b2e-4554-aa42-415aca7a6772" />
<img width="1854" height="818" alt="app-ui" src="https://github.com/user-attachments/assets/107648fa-b026-4c57-bd5d-0db701281ead" />
<img width="1846" height="886" alt="grafana-check-app" src="https://github.com/user-attachments/assets/e1a4e238-5639-425d-921d-3febae3c7cf4" />


















