<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="false">
            <tr v-for="(course, index) in dataList.data" style="font-size: 0.8rem" :key="course.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td>
                    <img :src="generateFileUrl(course.thumbnail, TYPE_COURSE)" style="width: 50px; height: 35px; border-radius: 0%" alt="">
                </td>
                <td>{{ limitText(course.title) }}</td>
                <td>{{ limitText(course.category ? course.category.title : '' )}}</td>
                <td>{{ formatDecimal(course.price) }}</td>
                <td>{{ course.sits }}/00</td>
                <td>
                    <!--    delete btn    -->
                    <button v-if="can('course_delete')" @click="deleteItem(course.id, dataList.current_page, perPage, {get_pending: true})" class="btn btn-danger btn-sm" :title="`Delete ${course.title}`" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                    <!--    accept btn    -->
                    <button v-if="can('course_accept')" @click="acceptCourse(course.id, dataList.current_page)" class="btn btn-success btn-sm" :title="`Accept ${course.title}`" type="button">
                        <i class="fas fa-vote-yea text-white"></i>
                    </button>
                </td>
            </tr>
        </data-table>

        <!-- Pagination Control -->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>
    </div>
</template>

<script>
    import DataTable from "../../components/dataTable";
    import ValidateFormModal from "../../components/validateFormModal";
    import Pagination from "../../components/Pagination"; // Import your Pagination component
    import validatorListComponentMixin from "../../mixins/validatorListComponentMixin";

    export default {
        name: "pendingCoursesComponent",
        components: { ValidateFormModal, DataTable, Pagination }, // Register Pagination component
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL', 'Thumbnail', 'Title', 'Category', 'Price(TK)', 'Sits/Sold', 'Actions'],
            };
        },

        mounted() {
            const _this = this;
            // Fetch all courses with paginated
            this.fetchData(this.urlGenerate(false, false, {page: 1, perPage: _this.perPage, get_pending: true}));
        },

        methods: {
            acceptCourse(id, currentPage) {
                const _this = this;
                this.httpReq({
                    urlSuffix: id,
                    method: 'put',
                    data: {'status': 1},
                    callback: () => {
                        _this.fetchData(this.urlGenerate(false, false, {page: currentPage, perPage: _this.perPage, get_pending: true}))
                    }
                })
            }
        }

    };
</script>
