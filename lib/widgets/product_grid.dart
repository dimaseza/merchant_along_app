part of 'widgets.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        itemCount: product.productItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          childAspectRatio: 0.75,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (ctx, index) => ProductItem(
          product.productItems[index],
          () {
            Navigator.of(context).pushNamed(
              EditProductPage.routeName,
              arguments: product.productItems[index].id,
            );
          },
        ),
      ),
    );
  }
}
