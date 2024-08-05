def get_palette(category):
    if category == 'F3':
        return f3_palette
    elif category == 'Pari':
        return pari_palette

def get_class_names(category):
    if category == 'F3':
        return f3_class
    elif category == 'Pari':
        return pari_class
        

###############
# Class names #
###############


f3_class = class_names = ['upper_ns', 'middle_ns', 'lower_ns', 'rijnland_chalk', 'scruff', 'zechstein']
#['0','1','2','3','4','5']

pari_class = ['Basement/Other', 'Slope Mudstone', 'Mass Transport Deposit', 'Slope Mudstone B', 'Slope Valley', 'Submarine Canyon System']
#['0','1','2','3','4','5']


###########
# Palette #
###########


f3_palette = [ 
  255,  255,  255, # 0
  238,  229,  102, # 1
  255, 72, 69,     # 2
  124,  99 , 34,   # 3
  193 , 127,  15,  # 4
  106,  177,  21,  # 5
]


pari_palette = [ 
  255,  255,  255, # 0
  238,  229,  102, # 1
  255, 72, 69,     # 2
  124,  99 , 34,   # 3
  193 , 127,  15,  # 4
  106,  177,  21,  # 5
]
