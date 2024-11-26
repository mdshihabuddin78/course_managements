
<template>
    <div class="pagination d-flex justify-content-center my-4">
        <!-- Previous button with arrow symbol -->
        <button
                @click="onPreviousClick"
                :disabled="currentPage === 1"
                class="btn pagination-btn mx-2"
        >
            &lt;  <!-- Left arrow symbol -->
        </button>

        <!-- Page number buttons with ellipsis -->
        <button
                v-for="page in paginationRange"
                :key="page"
                @click="onPageClick(page)"
                :disabled="currentPage === page"
                :class="['btn', 'pagination-btn', 'mx-1', { 'btn-active': currentPage === page, 'btn-inactive': currentPage !== page }]"
        >
            {{ page }}
        </button>

        <!-- Next button with arrow symbol -->
        <button
                @click="onNextClick"
                :disabled="currentPage === lastPage"
                class="btn pagination-btn mx-2"
        >
            &gt;  <!-- Right arrow symbol -->
        </button>
    </div>
</template>

<script>
    export default {
        props: {
            currentPage: {
                type: Number,
                required: true
            },
            lastPage: {
                type: Number,
                required: true
            },
        },
        computed: {
            paginationRange() {
                const totalNumbers = 5;  // Number of page buttons to display
                const totalBlocks = totalNumbers + 2;  // Including "Back" and "Next"

                if (this.lastPage <= totalBlocks) {
                    //console.log("Pagination range includes all pages:", Array.from({ length: this.lastPage }, (_, i) => i + 1));
                    return Array.from({ length: this.lastPage }, (_, i) => i + 1);
                }

                const pages = [];
                const left = Math.max(1, this.currentPage - 2);
                const right = Math.min(this.lastPage, this.currentPage + 2);

                for (let i = left; i <= right; i++) {
                    pages.push(i);
                }

                if (left > 1) {
                    pages.unshift(1);  // Add the first page
                    if (left > 2) {
                        pages.splice(1, 0, "...");  // Add ellipsis
                    }
                }

                if (right < this.lastPage) {
                    pages.push(this.lastPage);  // Add the last page
                    if (right < this.lastPage - 1) {
                        pages.splice(-1, 0, "...");  // Add ellipsis
                    }
                }

                console.log("Computed pagination range:", pages);
                return pages;
            }
        },
        methods: {
            onPreviousClick() {
                if (this.currentPage > 1) {
                    console.log(`Navigating to the previous page: ${this.currentPage - 1}`);
                    this.fetchData(this.urlGenerate(false, false, { page: this.currentPage - 1, perPage: this.perPage }));
                }
            },
            onNextClick() {
                if (this.currentPage < this.lastPage) {
                    console.log(`Navigating to the next page: ${this.currentPage + 1}`);
                    this.fetchData(this.urlGenerate(false, false, { page: this.currentPage + 1, perPage: this.perPage }));
                }
            },
            onPageClick(page) {
                if (this.currentPage !== page) {
                    console.log(`Navigating to the clicked page: ${page}`);
                    this.fetchData(this.urlGenerate(false, false, { page, perPage: this.perPage }));
                }
            }
        }
    };
</script>

<style scoped>
    .pagination {
        margin-top: 20px;
    }

    .pagination-btn {
        background-color: #423a8e;
        color: white;
        border: 1px solid #423a8e;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .pagination-btn:disabled {
        background-color: #ccc;
        color: #666;
        border: 1px solid #ccc;
    }

    .pagination-btn.btn-active {
        background-color: black;
        color: white;
        border: none;
    }

    .pagination-btn.btn-inactive {
        background-color: white;
        color: black;
        border: 1px solid #423a8e;
    }

    .pagination-btn:hover:not(:disabled) {
        background-color: #6656d3;
        color: white;
    }

    .pagination span {
        align-self: center;
        color: #423a8e;
    }
</style>