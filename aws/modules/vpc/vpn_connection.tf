#---------------------------------------------------
# AWS VPN connection
#---------------------------------------------------
resource "aws_vpn_connection" "vpn_connection" {
  count = var.enable_vpn_connection ? 1 : 0

  customer_gateway_id = var.vpn_connection_customer_gateway_id != "" ? var.vpn_connection_customer_gateway_id : (var.enable_customer_gateway ? element(aws_customer_gateway.customer_gateway.*.id, count.index) : null)
  type                = var.vpn_connection_type

  transit_gateway_id = var.vpn_connection_transit_gateway_id
  vpn_gateway_id     = var.vpn_connection_vpn_gateway_id != null ? var.vpn_connection_vpn_gateway_id : (var.enable_vpn_gateway ? element(aws_vpn_gateway.vpn_gateway.*.id, count.index) : null)
  static_routes_only = var.vpn_connection_static_routes_only

  tunnel1_inside_cidr   = var.vpn_connection_tunnel1_inside_cidr
  tunnel2_inside_cidr   = var.vpn_connection_tunnel2_inside_cidr
  tunnel1_preshared_key = var.vpn_connection_tunnel1_preshared_key
  tunnel2_preshared_key = var.vpn_connection_tunnel2_preshared_key

  tags = merge(
    {
      Name = var.vpn_connection_name != "" ? lower(var.vpn_connection_name) : "${lower(var.name)}-vpn-connection-${lower(var.environment)}"
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = [
    aws_customer_gateway.customer_gateway,
    aws_vpn_gateway.vpn_gateway
  ]
}
