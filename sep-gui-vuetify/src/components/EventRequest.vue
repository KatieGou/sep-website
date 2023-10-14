<template>
  <div>
    <h2>Event Request</h2>
    <v-btn @click="newRequest">new event request</v-btn>
    <v-dialog v-model="showDialog" width="600px">
      <v-card>
        <v-card-title>
          <span class="center">New Event Request</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-col>
              <v-row>
                <div>(For registered clients)</div>
              </v-row>
              <v-row>
                <div>Record Number</div>
                <v-text-field required clearable></v-text-field>
              </v-row>
              <v-row>
                <div>Client name</div>
                <v-text-field required clearable></v-text-field>
              </v-row>
              <v-row>
                <div>Event type</div>
                <v-text-field required clearable></v-text-field>
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
                <div>Exptected number of attendees: </div>
                <v-select :items="numberOfAttendees" single required></v-select>
              </v-row>
              <v-row>
                <v-card class="frame-card">
                  <v-card-title>
                    Preferences
                  </v-card-title>
                  <v-card-text>
                    <v-row>
                      <v-checkbox v-model="preferences.Decorations" label="Decorations"></v-checkbox>
                      <v-checkbox v-model="preferences.Food" label="Breakfast, lunch, dinner"></v-checkbox>
                    </v-row>
                    <v-row>
                      <v-checkbox v-model="preferences.Parties" label="Parties"></v-checkbox>
                      <v-checkbox v-model="preferences.Drinks" label="Soft/hot drinks"></v-checkbox>
                    </v-row>
                    <v-row>
                      <v-checkbox v-model="preferences.Photos" label="Photos/filming"></v-checkbox>
                    </v-row>
                  </v-card-text>
                </v-card>
              </v-row>
              <v-row>
                <div>Expected budget</div>
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
      numberOfAttendees: ['<5', '5-10', '10-20', '20-50', '50-100', '>100'],
      showStartPicker: false,
      showEndPicker: false,
      startDate: null,
      endDate: null,
      preferences: {
        Decorations: false,
        Food: false,
        Parties: false,
        Drinks: false,
        Photos: false,
      },
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
