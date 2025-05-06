from pydantic import BaseModel

class CategoryBase(BaseModel):
    name: str

class CategoryCreate(CategoryBase):
    pass

class Category(CategoryBase):
    category_id: int
    class Config:
        orm_mode = True

class ProductBase(BaseModel):
    name: str
    sku: str
    price: float
    category_id: int

class ProductCreate(ProductBase):
    pass

class Product(ProductBase):
    product_id: int
    class Config:
        orm_mode = True
