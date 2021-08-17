import 'package:flutter/material.dart';
import 'package:shop_app/Providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routName = '/editproductscreen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _discripFocusNode = FocusNode();
  final _imageUrl = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editProduct = Product(
    description: '',
    id: '',
    imageUrl: '',
    price: 0,
    title: '',
  );
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateState);
  }

  void dispose() {
    _imageUrlFocusNode.removeListener(_updateState);
    _priceFocusNode.dispose();
    _discripFocusNode.dispose();
    _imageUrl.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateState() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveform() {
    final isvalidate = _form.currentState!.validate();

    _form.currentState!.save();
    print(_editProduct.description);
    print(_editProduct.id);
    print(_editProduct.imageUrl);
    print(_editProduct.price);
    print(_editProduct.title);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Values'),
        actions: [
          IconButton(
            onPressed: () {
              _saveform();
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Tital'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Provide a value';
                  }
                },
                onSaved: (value) {
                  _editProduct = Product(
                    description: _editProduct.description,
                    id: _editProduct.id,
                    imageUrl: _editProduct.imageUrl,
                    price: _editProduct.price,
                    title: value!,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_discripFocusNode);
                },
                onSaved: (value) {
                  _editProduct = Product(
                    description: _editProduct.description,
                    id: _editProduct.id,
                    imageUrl: _editProduct.imageUrl,
                    price: double.parse(value!),
                    title: _editProduct.title,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Discription'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _discripFocusNode,
                onSaved: (value) {
                  _editProduct = Product(
                    description: value!,
                    id: _editProduct.id,
                    imageUrl: _editProduct.imageUrl,
                    price: _editProduct.price,
                    title: _editProduct.title,
                  );
                },
              ),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrl.text.isEmpty
                        ? Text('Enter Url')
                        : FittedBox(
                            child: Image.network(_imageUrl.text),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image Url'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrl,
                      focusNode: _imageUrlFocusNode,
                      onFieldSubmitted: (_) {
                        _saveform();
                      },
                      onSaved: (value) {
                        _editProduct = Product(
                            description: _editProduct.description,
                            id: _editProduct.id,
                            imageUrl: value!,
                            price: _editProduct.price,
                            title: _editProduct.title);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
