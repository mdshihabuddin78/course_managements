<template>
    <div class="container-fluid">
        <div class="row">
            <!-- column -->
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body" style="min-height: 80vh">
                        <div class="d-flex justify-content-between align-items-center">
                            <!-- Table title is dynamically set based on the page title from route meta -->
                            <h4 class="card-title mb-0">{{ tableTitle }}</h4>

                            <!-- Button to trigger the modal, emits the 'open-modal' event -->
                            <button v-if="showAddBtn"
                                    @click="()=>{
                                        this.openModal(
                                            '#backendModal',
                                            () => {
                                                this.$store.commit('setFormData', initFormData)
                                            }
                                        )
                                    }"
                                    class="btn btn-primary">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>

                        <!-- Conditional rendering: Show spinner if loading, else show the table -->
                        <div v-if="isEmptyData(dataList)" class="text-center my-3">
<!--                            {{ dataList }}-->
                            <div class="spinner-border" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>

                        <!-- Conditional rendering: Show spinner if loading, else show the table -->
                        <div v-if="isEmptyData(dataList.data)" class="text-center my-3">
<!--                            {{ dataList }}-->
                            <h3>No Data To Show</h3>
                        </div>

                        <div v-else class="table-responsive">
                            <table class="table user-table no-wrap">
                                <thead>
                                <tr>
                                    <!-- Loop through tableHeading array/object and display headings -->
                                    <th class="border-top-0" v-for="heading in tableHeading" :key="heading">{{ heading }}</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Slot for dynamic table rows (data passed by the parent) -->
                                <slot/>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "dataTable",

        // Props allow passing table headings from the parent component
        props: {
            tableHeading: {
                type: [Array, Object], // Can be either an array or object
                default: []
            },
            initFormData: {
                type: Object,
                default: () => ({ }),
            },
            showAddBtn: Boolean,
        },

        // Computed property for the table title based on route meta data
        computed: {
            tableTitle() {
                return this.$route.meta.pageTitle;
            }
        },
    }
</script>

<style scoped>
    /* Spinner styles */
    .spinner-border {
        width: 3rem;
        height: 3rem;
        border-width: 0.25rem;
    }

    /* Optional: Spinner positioning and centering */
    .text-center {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 50vh;
    }

    /* Additional scoped styles specific to this component */
</style>
