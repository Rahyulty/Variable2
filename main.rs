pub(crate) use std::collections::HashMap;

struct DataClient {
    data: HashMap<i32, i32>
}

impl DataClient {
    pub fn init() -> DataClient {
        DataClient {
            data: HashMap::new()
        }
    }
}