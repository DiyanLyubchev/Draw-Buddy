export 'io_asset_loader_stub.dart'
    if (dart.library.io) 'io_asset_loader_io.dart'
    if (dart.library.html) 'io_asset_loader_stub.dart';
