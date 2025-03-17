# Olist Analytics: Desempeño Financiero en Datos 📈

### Introducción
  El mercado del e-commerce ha crecido significativamente en los últimos años, impulsado por la digitalización y los cambios en el comportamiento del consumidor. Para las empresas de este sector, monitorear el desempeño financiero es esencial para tomar decisiones estratégicas informadas y garantizar un crecimiento sostenible.
  
  Olist es un marketplace brasileño que conecta a pequeños comerciantes con grandes plataformas de ventas en línea, facilitando la comercialización de productos con un único contrato y sin burocracia. Los comerciantes pueden vender sus productos a través de Olist Store, utilizando socios logísticos para las entregas.
  
  Este proyecto tiene como objetivo analizar el desempeño financiero de Olist entre 2016 y 2018, utilizando un enfoque basado en datos para proporcionar insights sobre ingresos, ticket promedio y tendencias de ventas. El análisis busca transformar datos brutos en información accionable, identificando patrones de crecimiento, estacionalidad y oportunidades de mejora.

###  🗂️ Fuente de Datos
  El dataset utilizado en este proyecto es el Brazilian E-Commerce Public Dataset by Olist, disponible en Kaggle. Contiene información de aproximadamente 100 mil pedidos realizados entre 2016 y 2018 en múltiples marketplaces de Brasil. Los datos permiten un análisis detallado de las ventas desde diversas dimensiones, incluyendo el estado del pedido, precio, pagos, flete, ubicación de los clientes, atributos de los productos y evaluaciones de los consumidores.
  
  El conjunto de datos está compuesto por 9 tablas, con 52 columnas y aproximadamente 100.000 filas:
  
**orders:** Información sobre los pedidos (ID del pedido, estado, fecha, etc.).

**order_items:** Detalles de los productos vendidos en cada pedido (ID del producto, precio, cantidad, etc.).

**customers:** Información sobre los clientes (ubicación, ID del cliente, etc.).

**products:** Detalles de los productos vendidos (categoría, nombre, etc.).

**sellers:** Información sobre los vendedores de la plataforma.

**order_payments:** Detalles sobre los pagos de los pedidos (valor, método de pago, etc.).

**order_reviews:** Evaluaciones y comentarios de los clientes.

**geolocation:** Datos de ubicación de clientes y vendedores.


La imagen a continuación muestra el esquema de datos: 

![image](https://github.com/user-attachments/assets/1310da22-af82-4aa5-b096-94310568be95)

Figura 1. Esquema de datos proporcionados por la empresa. Fuente: Olist. 



### Modelado de Datos

  Para estructurar el análisis, los datos fueron importados a MySQL. Inicialmente, se realizó una selección de los datos relevantes para el informe, seguida de la carga en Power BI utilizando consultas SQL.

#### Estructura del Modelo de Datos

Las siguientes tablas fueron seleccionadas para el estudio:
* customers
* orders
* order_items
* products
  
Durante el análisis inicial con MySQL, se realizó una verificación completa de valores nulos en todas las columnas de las tablas seleccionadas (customers, orders, order_items y products). No se identificaron valores nulos en las columnas críticas para el análisis. En cuanto a duplicados, la tabla order_items contenía valores duplicados en la columna order_id, lo cual se mantuvo, ya que un cliente puede comprar más de un producto en el mismo pedido.
  
Al cargar los datos en Power BI, los tipos de datos ya estaban correctos, por lo que no fue necesario realizar modificaciones. Además, se eliminaron columnas que no serían relevantes para el análisis, como order_item_id, customer_zip_code, order_status, entre otras.
  
Finalmente, se realizó una verificación de consistencia para identificar posibles anomalías, como valores negativos en la columna price o fechas fuera del período analizado (2016-2018). No se encontraron inconsistencias, lo que garantiza la calidad de los datos utilizados.
  
#### Modelado Star Schema
  En cuanto al modelado de datos, se adoptó el modelo Star Schema, que organiza la información en una tabla de hechos central conectada a tablas de dimensiones, facilitando la estructuración de los datos y la creación de análisis eficientes en Power BI. Este modelo permite la agregación de métricas importantes y optimiza la interpretación de los resultados.
  
  A continuación, las columnas utilizadas en la construcción de las tablas:
  
**Tabla de Hechos:** Contiene los datos transaccionales de las ventas (customer_id, date_id, freight_value, order_id, price, product_id).

**Tablas de Dimensiones:** Almacenan información detallada sobre clientes, categorías y fechas.

#### Power BI y DAX

En Power BI, se ajustaron los tipos de datos y se crearon medidas en DAX para calcular:

**Ingresos totales**

**Ticket promedio**

**Total de pedidos**

**Crecimiento anual de los ingresos**

Las relaciones se establecieron con cardinalidad (Muchos a Uno - *:1), conectando las tablas por sus respectivos IDs.

![image](https://github.com/user-attachments/assets/bf69e1ea-e943-4e39-9173-0f26c55708a1)

Figura 2. Modelo Star Schema en Power BI. Fuente: Autor. 

###  📊  Construcción del Dashboard
El dashboard creado en Power BI contiene:

**Tarjetas principales:** Ingresos totales, Ticket promedio, Total de pedidos, Crecimiento anual.

**Filtros:** Estado y año.

**Gráficos:**

Ingresos por categoría de producto (barras).

Ingresos por estado (barras).

Ingresos por mes (columnas).

Ingresos por año (línea).

Ticket promedio por año (línea).

Total de pedidos por año (barras).

![image](https://github.com/user-attachments/assets/d26119e7-0e38-4cfc-b938-41c824e812db)

Figura 3. Dashboard Final. Fuente: Autor


### 🎯 Resultados

Con base en el dashboard, se extrajeron las siguientes informaciones sobre el desempeño financiero del período analizado (2016-2018):

**Ingresos totales:** R$ 13,59 millones.

**Ticket promedio:** R$ 137,75.

**Total de pedidos:** 99.000.

**Crecimiento anual de los ingresos:** 205,33%.

### Principales Insights

**Tendencia de Crecimiento:** Los ingresos anuales crecieron consistentemente, con un aumento del 205,33% entre 2016 y 2018.

**Variación del Ticket Promedio:** El ticket promedio fue mayor en 2016 que en 2018, lo que sugiere que los clientes comenzaron a comprar productos más baratos o menos artículos por pedido.

**Pedidos por Año:** El número de pedidos aumentó significativamente en 2018 en comparación con 2016, reflejando un crecimiento expresivo en las ventas.

**Estacionalidad de las Ventas:** Se identificaron meses con picos de ventas, destacando oportunidades para campañas de marketing y optimización de inventario.

**Categorías Más Lucrativas:** Algunas categorías se destacaron en la generación de ingresos, sugiriendo potencial para expansión:

Belleza y Salud (R$ 1,26millones,Ticket promedio:R$ 142,45).

Relojes y Regalos (R$ 1,21millones,Ticket promedio:R$ 214,26).

Cama, Mesa y Baño (R$ 1,04millones,Ticket promedio:R$ 110,12).

**Impacto Regional:** Algunos estados tuvieron una mayor participación en los ingresos, indicando regiones estratégicas para inversiones en logística y marketing:

São Paulo: 41 mil ventas, Ticket promedio R$ 125,75, Ingresos R$ 5,20 millones.

Río de Janeiro: 13 mil ventas, Ticket promedio R$ 142,93,Ingresos R$ 1,82 millones.

Minas Gerais: 12 mil ventas, Ticket promedio R$ 137,33,Ingresos R$ 1,59 millones.

### Insights y Recomendaciones

* **Expansión de los Ingresos y Volumen de Pedidos** 
  
El aumento del 205,33% en los ingresos sugiere una expansión significativa de la plataforma. Para comprender mejor este crecimiento, se recomienda analizar si fue impulsado por la entrada de nuevos vendedores en Olist, el aumento de las ventas recurrentes de los vendedores ya registrados o una mayor diversidad de productos ofrecidos en la plataforma. Además, como el análisis se centró en los ingresos, sería interesante cruzar estos datos con información sobre márgenes de ganancia para entender qué segmentos generan mayor rentabilidad para los vendedores y para Olist.

* **Aumento de Pedidos vs. Caída del Ticket Promedio** 
  
El aumento en el volumen de pedidos, combinado con la caída en el ticket promedio, indica que los clientes están comprando productos más baratos o menos artículos por pedido. Para entender este movimiento, se recomienda analizar si los vendedores están ofreciendo más productos de bajo valor, investigar si las promociones y descuentos frecuentes están impactando el ticket promedio y crear materiales educativos para los vendedores sobre estrategias de precios y prácticas como cross-selling y up-selling para aumentar el valor promedio de las compras.

* **Explotar la Estacionalidad** 
  
Septiembre, octubre y diciembre tuvieron los menores volúmenes de pedidos, mientras que marzo, abril, mayo, julio y agosto registraron los mayores números de ventas. Notablemente, diciembre, que suele ser un mes fuerte para el comercio minorista, presentó una baja demanda. Esto puede estar relacionado con la anticipación de las compras en el Black Friday, la competencia con grandes minoristas o desafíos logísticos. Se recomienda investigar estos factores y explorar estrategias para impulsar las ventas en los períodos de menor demanda, como incentivos para los comerciantes, promociones dirigidas y mejoras operacionales.

* **Categorías Más Lucrativas** 
  
Los segmentos de Belleza y Salud, Relojes y Regalos y Cama, Mesa y Baño son los que generan más ingresos. Para potenciar este crecimiento, Olist puede:

Atraer nuevos vendedores que ofrezcan productos en estas categorías.

Ofrecer insights de mercado a los vendedores ya registrados para que exploren estas oportunidades de manera más eficiente.

* **Categorías con Baja Demanda**
  
Categorías como CDs y DVDs tienen un bajo volumen de ventas. En lugar de descartarlas, Olist puede evaluar si hay pocos vendedores registrados en estos segmentos, lo que afecta la oferta, y si estos productos aún tienen demanda. En caso afirmativo, se puede incentivar a los vendedores a explorarlos de manera más estratégica, como a través de paquetes promocionales.

* **Concentración de los Ingresos en Pocos Estados** 
  
São Paulo, Río de Janeiro y Minas Gerais concentran gran parte de las ventas en la plataforma. Para expandirse aún más, Olist puede analizar qué factores contribuyen al éxito en estos estados (como mayor poder adquisitivo, logística eficiente o estrategias de marketing efectivas) y probar la aplicación de estas mismas estrategias en otras regiones.

* **Personalización de las Estrategias por Estado**

Ajustar las acciones de marketing y soporte según las particularidades de cada región puede generar mejores resultados. Esto puede incluir campañas dirigidas a estados con potencial de crecimiento y soporte estratégico para vendedores en lugares con menor volumen de ventas, ayudándolos a posicionarse mejor en el marketplace.

### Conclusión

El análisis de los datos financieros de Olist reveló insights valiosos que pueden ayudar a la empresa a fortalecer su base de vendedores y maximizar las ventas en la plataforma. La creación de materiales educativos, acciones regionales dirigidas y un análisis más profundo de las categorías de productos son estrategias que pueden impulsar aún más los resultados de la empresa y sus socios.

La utilización de un modelo Star Schema en MySQL, junto con visualizaciones interactivas en Power BI, proporcionó una visión clara y objetiva de los datos, facilitando la identificación de patrones y tendencias. Este proyecto se centró en el desempeño financiero de Olist en los últimos tres años, analizando métricas como ingresos, ticket promedio y volumen de pedidos. Sin embargo, la inclusión de métricas adicionales, como márgenes de ganancia y retención de clientes, puede ofrecer un contexto más completo, permitiendo una comprensión más profunda sobre la sostenibilidad del crecimiento de la plataforma.

Este proyecto me permitió mejorar mis habilidades en SQL, Power BI y análisis de datos, además de desarrollar un pensamiento crítico para transformar datos en insights accionables. Uno de los principales desafíos fue manejar la gran cantidad de datos, pero el modelado Star Schema facilitó la organización y el análisis, haciendo el roceso más eficiente.

Estoy abierta a sugerencias y comentarios para seguir mejorando mis habilidades y proyectos. ¡Gracias por leer hasta aquí!

## Tecnologías Utilizadas

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original-wordmark.svg" width="50"/> **MySQL**: Procesamiento de datos  

<img src="https://upload.wikimedia.org/wikipedia/commons/c/cf/New_Power_BI_Logo.svg" width="50"/> **Power BI**: Visualización  

## 📎 Recursos
Dataset: Disponible en [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## 📬 Contacto

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/ariel-felix)
