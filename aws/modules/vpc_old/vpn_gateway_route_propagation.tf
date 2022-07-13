#---------------------------------------------------------------
# AWS VPN gateway route propagation
#---------------------------------------------------------------
resource "aws_vpn_gateway_route_propagation" "vpn_gateway_route_propagation" {
  count = var.enable_vpn_gateway_route_propagation ? 1 : 0

  vpn_gateway_id = var.vpn_gateway_route_propagation_vpn_gateway_id != "" ? var.vpn_gateway_route_propagation_vpn_gateway_id : (var.enable_vpn_gateway ? element(aws_vpn_gateway.vpn_gateway.*.id, count.index) : null)
  route_table_id = var.vpn_gateway_route_propagation_route_table_id != "" ? var.vpn_gateway_route_propagation_route_table_id : (length(var.public_subnet_cidrs) > 0 ? element(aws_route_table.public_route_tables.*.id, count.index) : null)

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = [
    aws_vpn_gateway.vpn_gateway
  ]
}
