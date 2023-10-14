<template>
  <div>
    <h2>Client Request</h2>
    <v-btn @click="newRequest">new client reqeust</v-btn>
    <v-dialog v-model="showDialog" width="1000px">
      <v-card>
        <v-card-title>
          <span class="center">New Client Request</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-col>
              <v-row>
                <div>Client Record Number</div>
                <v-text-field required clearable></v-text-field>
              </v-row>
              <v-row>
                <v-col>
                  <div>Client name</div>
                  <v-text-field required clearable></v-text-field>
                </v-col>
                <v-col>
                  <div>Expected Number</div>
                  <v-text-field required clearable></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col>
                  <div>Event Type</div>
                  <v-text-field required clearable></v-text-field>
                </v-col>
                <v-col>
                  <div>Planned Budget</div>
                  <v-text-field required clearable></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <div>Description</div>
                <v-textarea required clearable></v-textarea>
              </v-row>
              <v-row>
                <v-col>
                  <div>From</div>
                  <v-btn @click="chooseStartDate">Choose date</v-btn>
                  <v-date-picker v-if="showStartPicker" v-model="startDate" @input="onStartDateSelected"
                    @click:save="onStartDateSelected" @click:cancel="onStartDateSelected"></v-date-picker>
                  <v-text-field readonly>{{ startDate ? startDate : '' }}</v-text-field>
                </v-col>
                <v-col>
                  <div>To</div>
                  <v-btn @click="chooseEndDate">Choose date</v-btn>
                  <v-date-picker v-if="showEndPicker" v-model="endDate" @input="onEndDateSelected"
                    @click:save="onEndDateSelected" @click:cancel="onEndDateSelected"></v-date-picker>
                  <v-text-field readonly>{{ endDate ? endDate : '' }}</v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col>
                  <v-card class="frame-card">
                    <v-card-title>
                      Decorations
                    </v-card-title>
                    <v-card-text>
                      <v-textarea required clearable></v-textarea>
                    </v-card-text>
                  </v-card>
                </v-col>
                <v-col>
                  <v-card class="frame-card">
                    <v-card-title>
                      Food/Drinks
                    </v-card-title>
                    <v-card-text>
                      <v-textarea required clearable></v-textarea>
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>
              <v-row>
                <v-col>
                  <v-card class="frame-card">
                    <v-card-title>
                      Films/Photos
                    </v-card-title>
                    <v-card-text>
                      <v-textarea required clearable></v-textarea>
                    </v-card-text>
                  </v-card>
                </v-col>
                <v-col>
                  <v-card class="frame-card">
                    <v-card-title>
                      Music
                    </v-card-title>
                    <v-card-text>
                      <v-textarea required clearable></v-textarea>
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>
              <v-row>
                <v-col>
                  <v-card class="frame-card">
                    <v-card-title>
                      Poster/Art Work
                    </v-card-title>
                    <v-card-text>
                      <v-textarea required clearable></v-textarea>
                    </v-card-text>
                  </v-card>
                </v-col>
                <v-col>
                  <v-card class="frame-card">
                    <v-card-title>
                      Computer-Related Issues
                    </v-card-title>
                    <v-card-text>
                      <v-textarea required clearable></v-textarea>
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>
              <v-row>
                <div>Other needs</div>
                <v-text-field required clearable></v-text-field>
              </v-row>
            </v-col>
          </v-container>
        </v-card-text>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import { VDatePicker } from 'vuetify/lib/labs/components.mjs';
export default {
  data() {
    return {
      showDialog: false,
      showStartPicker: false,
      showEndPicker: false,
      startDate: null,
      endDate: null,
    };
  },
  methods: {
    newRequest() {
      this.showDialog = true;
    },
    chooseStartDate() {
      this.showStartPicker = true;
    },
    onStartDateSelected() {
      this.showStartPicker = false;
    },
    chooseEndDate() {
      this.showEndPicker = true;
    },
    onEndDateSelected() {
      this.showEndPicker = false;
    },
  },
  components: {
    VDatePicker,
  },
}
</script>