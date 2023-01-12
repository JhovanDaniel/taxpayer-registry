module TaxpayerHelper
    def sample_status_color(taxpayer)
        taxpayer.active(taxpayer) ? "bg-success" : "bg-warning"
    end
end
