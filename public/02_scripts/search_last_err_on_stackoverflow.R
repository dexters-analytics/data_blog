


search_last_err_on_so <- function() {
    last_err_msg <- geterrmessage()
    if (grepl("rlang::last_error", last_err_msg)) {
        last_err_msg <- rlang::last_error()$message
    }
    browseURL(paste0(
        "https://stackoverflow.com/search?q=",
        URLencode(last_err_msg)
    ))
}

options(error = search_last_err_on_so)