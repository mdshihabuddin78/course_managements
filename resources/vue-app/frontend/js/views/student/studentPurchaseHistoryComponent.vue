<template>
    <div class="container my-5">
        <table class="table table-bordered">
            <thead class="thead-light">
            <tr>
                <th>SL</th>
                <th>Course</th>
                <th>Date</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Invoice</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(purchase, index) in purchases" :key="purchase.id">
                <td>{{ index + 1 }}</td>
                <td>{{ purchase.course ? purchase.course.title : 'NA' }}</td>
                <td>{{ purchase.created_at }}</td>
                <td>Bkash</td>
                <td>{{ purchase.course ? formatDecimal(purchase.course.price)+' TK' : 'NA' }}</td>
                <td>Purchased</td>
                <td class="text-center">
                    <button @click="downloadVoucher(purchase)" class="btn view-btn btn-sm">Download<i class="fas fa-download ml-1"></i></button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
    import { jsPDF } from "jspdf";

    export default {
        name: "purchasesJournalComponent",

        data() {
            return {
                purchases: [],
            }
        },
        mounted() {
            const _this = this;
            this.fetchData(this.urlGenerate(), (result) => {
                _this.purchases = result;
            });
        },
        methods: {
            downloadVoucher(purchase) {
                if(this.isEmptyData(purchase)) return;

                const doc = new jsPDF("portrait", "mm", "a4");

                // Set Background Color
                doc.setFillColor(240, 240, 240); // Light gray background
                doc.rect(0, 0, doc.internal.pageSize.width, doc.internal.pageSize.height, 'F');

                // Outer Border
                const margin = 10;
                doc.setLineWidth(1);
                doc.setDrawColor(0, 123, 255); // Blue color border
                doc.rect(margin, margin, doc.internal.pageSize.width - margin * 2, doc.internal.pageSize.height - margin * 2);

                // Title
                doc.setFont("Helvetica", "bold");
                doc.setFontSize(24);
                doc.setTextColor(0, 51, 153); // Dark blue color
                doc.text("VOUCHER", doc.internal.pageSize.width / 2, 30, { align: "center" });

                // Divider
                doc.setLineWidth(0.5);
                doc.setDrawColor(0, 123, 255);
                doc.line(margin + 10, 40, doc.internal.pageSize.width - margin - 10, 40);

                // Voucher Information Table
                const startX = 20;
                const startY = 50;
                const lineHeight = 10;

                // Data Rows with Labels
                const dataRows = [
                    ["User Name", this.auth.name || "NA"],
                    ["Course Title", purchase.course ? purchase.course.title : "NA"],
                    ["Price", `${this.formatDecimal(purchase.course ? purchase.course.price : 0)} TK`],
                    ["Purchase Date", purchase.created_at],
                    ["Payment Type", "Bkash"],
                    ["Status", "Purchased"]
                ];

                doc.setFontSize(14);
                doc.setTextColor(0, 0, 0); // Black color for text
                dataRows.forEach(([label, value], index) => {
                    doc.setFont("Helvetica", "bold");
                    doc.text(`${label}:`, startX, startY + lineHeight * index);

                    doc.setFont("Helvetica", "normal");
                    doc.text(value, startX + 40, startY + lineHeight * index);
                });

                // Bottom Signature Line
                const signatureY = startY + dataRows.length * lineHeight + 30;
                doc.setDrawColor(0, 0, 0); // Black color for signature line
                doc.line(startX, signatureY, startX + 80, signatureY);
                doc.text("Authorized Signature", startX, signatureY + 5);

                // Save the voucher as a PDF
                const fileName = `${this.auth.name || "NA"}_Voucher_${purchase.created_at}.pdf`;
                doc.save(fileName);
            },
        },
    };
</script>

<style scoped>
    .view-btn {
        background-color: #f5f5f5;
        color: #333;
        border-radius: 8px;
    }

    table td, th {
        vertical-align: middle !important;
    }
</style>
