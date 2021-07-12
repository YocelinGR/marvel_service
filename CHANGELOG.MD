# CHANGELOG

## [v.0.3.3] - 2021-06-07
### Fixed
- Fix the endpoints: `get "/receivables"` and `get "/receivables/monthly_sales"` to not take in count the sale_payment_operations canceled or deleted from the amounts calculations 
### Changed
- Change the `internal_note` param on table `account_operations` from string to text type

## [v.0.3.2] - 2021-05-11

### Fixed 
- Only take in count the valid sale payment operations when calculates sale balance amounts

### Added
- Add the field `sale_payment_created_with_sale` to the type `sale_payments_operations`. This value will be true if the payment was created with the sale and false by default and when was created after the sale creation process.
  - Solves issue: [CHAIN-13451](https://app.clickup.com/t/1229867/CHAIN-13451)
- Add `account_operation_status_id` field on `account_operation_basic_info` resolver
- Add `sale_payment_operation_status_id` field on `sale_payment_operation` resolver
- Function to change sale_payments status  when the sale is canceled

### Removed
- Recurring jobs to create pending items, these tasks were migrated to core-utils service

## [v.0.3.1] - 2021-04-22
### Fixed
- Fix error on get account receivables by company and by client id
  - Fix issue: [CHAIN-12633](https://app.clickup.com/t/1229867/CHAIN-12633)
## Added
  - Endpoint to update rep_cancellation by id

## [v.0.3.0] - 2021-04-15
### Added
  - Add recurrent tasks to create pending items for sale payment that are due and those that already expired
  - Add field sale payment operation status id to sale_payment_operation table
  - Add rep_cancellation fields for REP cancellation process
  - Endpoint to get sale_payment with related sale
  - Endpoint to cancel a REP
  - Add cancellation_datetime field on account_operation table 
  - Add slack notifications for errors on pending items creation
  - Env vars
    - CORE_UTILS_BASE_URL
    - SALE_PAYMENTS_PENDINGS_SLACK_WEBHOOK_ID

### Changed

- The process of canceling / deleting an account operation no longer deletes sale_payments_operations, it now updates the status to "cancelled"
- Endpoints to get account operations now includes rep cancellation node

## [v.0.2.5] - 2021-03-31
### Fixed
-  Hotfix the amounts capacity from integer to bigint on DB and manage as decimal
-  Fix use of decimals on type decimal
-  Fix show precalculated amount based on a date without hours, minutes and seconds

### Changed
- Reduce the pool size to 1 in all connections 

## [v0.2.4] - 2021-02-25

- Add field account_operation_category on the account operation type
- Fix issue: [CHAIN-12098](https://app.clickup.com/t/1229867/CHAIN-12098)
  
## [v0.2.3] - 2021-02-25

### Added

- Add migrations to allow delte on cascade of sales and account operations

## [v0.2.2] - 2021-02-04

### Fixed
  - Fix endpoint GET /api/v1/receivables to allow take in count partial payments for the expected ones
  - Fix endpoint GET /api/v1/receivables/monthly_sales to allow take in count partial payments for the expected ones
    - Solves issue: [jx0drn](https://app.clickup.com/t/jx0drn)


## [v0.2.1] - 2021-01-19

### Add

- Add validation to return error when a sale_payment does not exist on account operation create
- Add validation to return error when a sale_payment is not related to the sale given on the account operation create request
- Add validation to can not create a account operation without all its total distributed on allthe sales related

### Fixed

### Changed

## [v0.2.0] - 2021-01-15

### Add

- Add env var
  - INCOME_SALES_BASE_UR
  - CLIENTS_DB_USERNAME
  - CLIENTS_DB_PASSWORD
  - CLIENTS_DB_NAME
  - CLIENTS_DB_HOSTNAME
  - COMPANIES_DB_USERNAME
  - COMPANIES_DB_PASSWORD
  - COMPANIES_DB_NAME
  - COMPANIES_DB_HOSTNAME
- Add functions to get requiered client and company info for rep
- Add endpoint "../api/v1/account_operation/:id/rep_info" to get requiered info for rep
- Add fields partiality, previous_balance and outstanding_balance to the type sales_payments_operations
- Add node sale_payments_operations to the get account operation by id and by account id views and resolvers
- Add endpoint to update a rep
- Add endpoint to create a rep
- Fix balance amount for sales_payments_operations in order to allow rep generation
- Add endpoint to get monthly accounts receivables by client
- Add endpoint to update a sale
- Add field sale_status_id to the sale table
- Add field payment_detail to account operation schema
- Add resolve of payment forma and rep status to rep view
- Add new enpoint to delete physically a sale and its node related
  - Can not delete a sale how have account operations related to other sales
- Add trigger to discount an account operation amount when it is delated with valid status (not canceled or deleted)

### Change

- Remove field detalle_de_pago from rep schema

## [v0.1.3] - 2020-12-18

### Fixed

- Fix typo on function get_valid_company_sales/1 to get saleNumber

## [v0.1.2] - 2020-12-18

### Fixed

- Change changelog file name to CHANGELOG.MD

## [v0.1.1] - 2020-12-18

### Added

- Endpoint "..api/v1/total_sales" now allows to get only client total amount

## [v0.1.0] - 2020-12-17

### Added

- Function to migrate existing accounts (before business-management integration)
- Add endpoint "..api/v1/sales" to create a sale with its sale payments, sale payments operations and account operations.
- Paginate account operations endpoint
- Add income-sales-ms integration to update sale status
- Add endpoint "..api/v1/account_operations" to create a account operations and relate it to its respective sales payments
- Add env var
  - INCOME_SALES_BASE_UR

### Changed

- Change the format formoney fields to not set the default separator for groups of thousands
