<template>
    <div class="container my-5">
        <h1 class="text-center mb-4">20+ Payment Gateway is Ready to Get Payment</h1>
        <hr class="custom-hr" />
        <div class="row">
            <!-- Payment Gateway Logos -->
            <div v-for="(logo, index) in logos" :key="index" class="col-lg-2 col-md-4 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm border-0">
                    <div class="card-img-container text-center p-3">
                        <img class="card-img-top img-fluid" :src="baseUrl + logo.src" :alt="logo.alt" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
    .card-img-top {
        max-height: 80px;
        width: auto;
    }

    .card-img-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 120px;
    }

    .card {
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Increased shadow for better visibility */
    }

    .card:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3); /* Increased hover shadow */
    }

    h1 {
        font-weight: bold;
        color: #002347;
    }

    /* Custom horizontal line below h1 */
    .custom-hr {
        border: 1px solid green;
        width: 80%;
        margin: 0 auto;
        margin-bottom: 30px;
        font-weight: bold;
    }

    @media (max-width: 768px) {
        .card-img-top {
            max-height: 60px;
        }
    }
</style>


<script>
    export default {
        name: "PaymentImgSection",
        data() {
            return {
                baseUrl: '', // Set your base URL here
                logos: [
                    { src: '/frontend/img/payment-img/Logo1.svg', alt: 'Logo1' },
                    { src: '/frontend/img/payment-img/Logo__10.svg', alt: 'Logo__10' },
                    { src: '/frontend/img/payment-img/Logo__AmarPay.svg', alt: 'Logo__AmarPay' },
                    { src: '/frontend/img/payment-img/Logo__Bkash.svg', alt: 'Logo__Bkash' },
                    { src: '/frontend/img/payment-img/Logo__Flutter-Wave.svg', alt: 'Logo__Flutter-Wave' },
                    { src: '/frontend/img/payment-img/Logo__Google-pay.svg', alt: 'Logo__Google-pay' },
                    { src: '/frontend/img/payment-img/Logo__Hit-Pay.svg', alt: 'Logo__Hit-Pay' },
                    { src: '/frontend/img/payment-img/Logo__iyZico.svg', alt: 'Logo__iyZico' },
                    { src: '/frontend/img/payment-img/Logo__Jazz-Cash.svg', alt: 'Logo__Jazz-Cash' },
                    { src: '/frontend/img/payment-img/Logo__KKiaPay.svg', alt: 'Logo__KkiaPay' },
                    { src: '/frontend/img/payment-img/Logo__MasterCard.svg', alt: 'Logo__MasterCard' },
                    { src: '/frontend/img/payment-img/Logo__Mercado-Pago.svg', alt: 'Logo__Mercado-Pago' },
                    { src: '/frontend/img/payment-img/Logo__Midtrans.svg', alt: 'Logo__Midtrans' },
                    { src: '/frontend/img/payment-img/Logo__Mollie.svg', alt: 'Logo__Mollie' },
                    { src: '/frontend/img/payment-img/Logo__Nagad.svg', alt: 'Logo__Nagad' },
                    { src: '/frontend/img/payment-img/Logo__PayLater.svg', alt: 'Logo__PayLater' },
                    { src: '/frontend/img/payment-img/Logo__Paypal.svg', alt: 'Logo__Paypal' },
                    { src: '/frontend/img/payment-img/Logo__Paystack.svg', alt: 'Logo__Paystack' },
                    { src: '/frontend/img/payment-img/Logo__Paytm.svg', alt: 'Logo__Paytm' },
                    { src: '/frontend/img/payment-img/Logo__Skrill.svg', alt: 'Logo__Skrill' },
                    { src: '/frontend/img/payment-img/visa.svg', alt: 'Logo__SSLCommerz' },
                    { src: '/frontend/img/payment-img/Logo__Telr.svg', alt: 'Logo__Telr' },
                    { src: '/frontend/img/payment-img/rocket.png', alt: 'Logo__Telr' },
                    { src: '/frontend/img/payment-img/upay.png', alt: 'Logo__Telr' },
                ],
            };
        },
    };
</script>
