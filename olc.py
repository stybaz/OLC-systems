class HTML:
    def __init__(self, tag, property):
        self.tag = tag
        self.property = property

    def __str__(self):
        property_str = ' '.join([f'{name}="{value}"' for name, value in self.property.items()])
        return f'<{self.tag} {property_str}></{self.tag}>'


input = HTML('input', {'type': 'text', 'name': 'username'})
select = HTML('select', {'name': 'country'})
a = HTML('a', {'href': 'https://example.com', 'target': '_blank'})
img = HTML('img', {'src': 'image.jpg', 'alt': 'Image'})
div = HTML('div', {'class': 'container'})
form = HTML('form', {'action': 'submit.php', 'method': 'post'})


print(input)
print(select)
print(a)
print(img)
print(div)
print(form)
