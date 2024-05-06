library(ggplot2)

data1 <- read.csv('datas/bio-ia-1.csv', encoding = 'UTF-8')
data2 <- read.csv('datas/bio-ia-2.csv', encoding = 'UTF-8')

p1 <- ggplot(data1) +
  geom_bar(
    aes(x = reorder(Concentration, Id), y = Absorbance, fill = Group),
    stat = 'identity',
    position = 'dodge'
  ) +
  labs(x = 'Concentration') +
  facet_grid(.~Group) +
  theme_minimal() +
  theme(
    axis.title.y = element_text(margin = margin(l = 15, r = 15)),
    axis.title.x = element_text(margin = margin(t = 15, b = 10))
  )

ggsave('charts/concentration-absorbance-groups.png', p1, width = 15, dpi = 800, bg = 'white')
p1

p2 <- ggplot(data2) +
  geom_bar(
    aes(x = reorder(Concentration, Id), y = Absorbance),
    stat = 'identity',
    fill = '#499dec',
    width = 0.8
  ) +
  geom_errorbar(
    aes(
      x = reorder(Concentration, Id),
      ymin = Absorbance - Stdev,
      ymax = Absorbance + Stdev
    ),
    width = 0.2
  ) +
  labs(x = 'Concentration') +
  theme_minimal() +
  theme(
    axis.title.y = element_text(margin = margin(l = 15, r = 15)),
    axis.title.x = element_text(margin = margin(t = 15, b = 10))
  )

ggsave('charts/concentration-absorbance.png', p2, dpi = 800, width = 8, bg = 'white')
p2
